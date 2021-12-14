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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.java.bookclub.models.Book;
import com.java.bookclub.models.User;
import com.java.bookclub.services.BookService;
import com.java.bookclub.services.UserService;

@Controller
public class MainController {

	@Autowired
	UserService userService;
	
	@Autowired
	BookService bookService;
	
	
	
	@GetMapping("/book/new") 
	public String addBook(HttpSession session, @ModelAttribute("newBook")Book newBook,Model model, Long id) {
		return "addBook.jsp";
	}

	@PostMapping("/book/new")
	public String processNewBook(@Valid @ModelAttribute("newBook")Book newBook,BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<User> users = userService.allUsers();
			model.addAttribute("users", users);
			return "addBook.jsp";	
		} else {
			bookService.addBook(newBook);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/show/{id}")
	public String showOneBook(HttpSession session, @PathVariable("id")Long id, Model model) {
		Book book = bookService.findOne(id);
		model.addAttribute("book", book);
			return "showBook.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editBook(HttpSession session, @PathVariable("id")Long id, Model model) {
		Book book = bookService.findOne(id);
		model.addAttribute("editBook", book);
			return "editBook.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditBook(@Valid @ModelAttribute("editBook")Book editBook, BindingResult result,@PathVariable("id")Long id, HttpSession session) {
		if(result.hasErrors()) {
//			Book book = bookService.findOne(id);
//			model.addAttribute("editBook", book);
				return "editBook.jsp";
		} else {
			bookService.updateBook(editBook);
			return "redirect:/dashboard";
		}
	}
}