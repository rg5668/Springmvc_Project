package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Hotel4s;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Hotel_Sub4s;
import service.FpsDaoMybatis;
import service.HotelDaoMybatis;

@Controller
public class FpsController {
	@Autowired
	FpsDaoMybatis dao;
	@Autowired
	HotelDaoMybatis mdao;
	
	@RequestMapping("mainForm") 
	private String mainForm(Model m) {
	
		mdao.resStatus1();
		mdao.resStatus2();
		return "fps/mainForm"; 
	}

	
	@RequestMapping("areaForm") 
	private String areaForm(Model m, String area_code) {
		
		
		List<Hotel4s> list = dao.list(area_code);
		 
		m.addAttribute("list", list);
		m.addAttribute("area_code",area_code);
		
		return "fps/areaForm"; 
	}
	
	@RequestMapping("searchForm") 
	private String searchForm(Model m, String hotel_name) {
		
		
		List<Hotel4s> list = dao.search(hotel_name);
		m.addAttribute("list",list);
		
		return "fps/searchForm"; 
	}
	
	@RequestMapping("saleForm") 
	private String saleForm(Model m, String hotel_code, String hotel_img) {
		
		
		List<Hotel4s_Join_Hotel_Sub4s> list = dao.saleList(hotel_code);
		
		m.addAttribute("list",list);
		m.addAttribute("hotel_code",hotel_code);
		m.addAttribute("hotel_img",hotel_img);
		
		return "fps/saleForm"; 
	}
	
	@RequestMapping("bestForm") 
	private String bestForm(Model m, String hotel_code) {
		
		List<Hotel4s_Join_Hotel_Sub4s> list = dao.bestList(hotel_code);
		
		m.addAttribute("list",list);
		m.addAttribute("hotel_code",hotel_code);
		
		return "fps/bestForm"; 
	}
	
	@RequestMapping("temaForm") 
	private String temaForm(Model m, String theme_code) {
		
		List<Hotel4s> list = dao.temaList(theme_code);
		
		m.addAttribute("list",list);
		m.addAttribute("theme_code",theme_code);
		
		return "fps/temaForm"; 
	}
	
	@RequestMapping("allForm")
	private String allForm(Model m) {
		
		List<Hotel4s> hlist = dao.alllist();
		
		m.addAttribute("hlist",hlist);
		
		
		return "fps/allForm";
	}
}
