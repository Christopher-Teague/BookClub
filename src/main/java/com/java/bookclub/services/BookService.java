package com.java.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.bookclub.models.Book;
import com.java.bookclub.repositiories.BookRepository;

@Service
public class BookService{
	
	@Autowired
	BookRepository bookRepo;
	

		//   CREATE   \\
	
	public Book addBook(Book book) {
		return bookRepo.save(book);
	}

	
		//   RETRIEVE   \\

	public List<Book> allBooks() {
		return bookRepo.findAll();
	}
	
	public Book findOneBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}

		//   UPDATE   \\

	public Book updateBook(Book book) {
		return bookRepo.save(book);
	}

		//   DELETE   \\
	
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);		
	}

}
