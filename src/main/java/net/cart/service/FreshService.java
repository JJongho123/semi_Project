package net.cart.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FreshService {
	void cartList(HttpServletRequest request, HttpServletResponse response) throws IOException;
	
	void cartDelete(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
