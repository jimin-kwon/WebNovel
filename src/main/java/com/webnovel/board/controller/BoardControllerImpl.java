package com.webnovel.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webnovel.board.domain.AttachFileDTO;
import com.webnovel.board.domain.BoardAttachVO;
import com.webnovel.board.domain.BoardVO;
import com.webnovel.board.service.BoardService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller("boardController")
@RequestMapping("/board")
@Log4j
public class BoardControllerImpl implements BoardController {

	@Autowired
	private BoardService boardService;
	
//장르 메인
	@Override
	@GetMapping("/genreMain")
	public String genreMain(@RequestParam("genre") String genre, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("menu", "");
		model.addAttribute("genreMainList", boardService.genreMainList(genre));
		return "/genreMain";
	}
	
//장르 리스트
	@Override
	@GetMapping("/genreList")
	public String genreList(@RequestParam("articleNO") int articleNO, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("menu", "");
		model.addAttribute("articleList", boardService.articleList(articleNO));
		return "/genreList";
	}
	
//장르 디테일
	@Override
	@GetMapping("/genreDetail")
	public String genreDetail() {
		return "/genreDetail";
	}

	
	@Override
	@GetMapping("/boardForm")
	public String boardForm() {
		return "/boardForm";
	}
//보드 리스트 	
	@Override
	@GetMapping("/boardList")
	public String boardList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("menu", "");
		String id = (String) session.getAttribute("id"); 
		model.addAttribute("list", boardService.myBoardList(id));		
		return "/boardList";
	}

//보드 새 글쓰기	
	@Override
	@GetMapping("/boardNewForm")
	public String boardNewForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("menu", "");
		return "/boardNewForm";
	}

//보드 정보 수정하기 	
	@Override
//	@GetMapping("/workInfoModify")
//	@PostMapping("/workInfoModify")
	@RequestMapping(value="/workInfoModify" ,method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String workInfoModify(
				@RequestParam("title") String title,
				@RequestParam("content") String content,
				Map map, Model model, HttpServletRequest request ) {
			
		HttpSession session = request.getSession();	
		BoardVO=(boardVO)session.getAttribute("")
		session.setAttribute("menu", "");
	
		
		log.info("Map >>> " + map);
		
		//List list  = boardService.imageList(map.get("articleNO"));
		//map.put("imageList", list);		
		model.addAttribute("Map", map);
		
		
		return "/workInfoModify";
	}

//보드 글 쓰기
	@Override
	@PostMapping("/writeboard")
	public String writeboard(BoardVO boardVO, RedirectAttributes rttr) {
		log.info("register: " + boardVO);
		if (boardVO.getAttachList() != null) {
			boardVO.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("==========================");
		boardService.writeboard(boardVO);
		rttr.addFlashAttribute("result", boardVO.getArticleNO());
		return "redirect:/board/boardList";
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

//파일 업로드 	
	@Override
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder
		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			String uploadFileName = multipartFile.getOriginalFilename();
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				// check image type file
				if (checkImageType(saveFile)) {
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				// add to List
				list.add(attachDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName: " + fileName);
		File file = new File("c:\\upload\\" + fileName);
		log.info("file: " + file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
//	@Override
//	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
//	@ResponseBody
//	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
//		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
//		if (resource.exists() == false) {
//			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//		}
//		String resourceName = resource.getFilename();
//		log.info("resourceName: " + resourceName);
//		log.info("userAgent: " + userAgent);
//		// remove UUID
//		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
//		HttpHeaders headers = new HttpHeaders();
//		try {
//			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);
//			String downloadName = null;
//			if (checkIE) {
//				downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
//			} else {
//				if(userAgent.contains("Edge")) {
//					downloadName = resourceOriginalName;
//				}else {
//					downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
//				}
//			}
//			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
//	}

	
//파일 삭제하기 	
	@Override
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile: " + fileName);
		File file;
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName: " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int articleNO) {
		log.warn("getAttachList " + articleNO);
		return new ResponseEntity<>(boardService.getAttachList(articleNO), HttpStatus.OK);
	}


}
