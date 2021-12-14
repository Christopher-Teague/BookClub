package com.java.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.java.bookclub.models.Book;
import com.java.bookclub.models.LoginUser;
import com.java.bookclub.models.User;
import com.java.bookclub.services.BookService;
import com.java.bookclub.services.UserService;

	@Controller
	public class LoginController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private BookService bookService;
	
	@GetMapping("/")
	public String index(Model model) {
	    model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
	        BindingResult result, Model model, HttpSession session) {
	    userServ.register(newUser, result);
	    if(result.hasErrors()) {
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    } 
	    session.setAttribute("user_id", newUser.getId());
	    session.setAttribute("userName", newUser.getUserName());
	    return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	        BindingResult result, Model model, HttpSession session) {
	    User user = userServ.login(newLogin, result);
	    if(result.hasErrors()) {
	        model.addAttribute("newUser", new User());
	        return "index.jsp";
	    }
	    session.setAttribute("user_id", user.getId());
	    session.setAttribute("userName", user.getUserName());
	    return "redirect:/dashboard";
		}

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
			}
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		return "dashboard.jsp";
	}

	@GetMapping("/logout") 
		public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}