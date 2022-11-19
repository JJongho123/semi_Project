package net.cart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cart.dao.FreshDao;
import net.cart.vo.CartVo;
import net.cart.vo.ProductVo;

public class FreshServiceImpl implements FreshService {
	
	@Override
	public void cartList(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPage = "/fresh/cartList.jsp";
		
		FreshDao dao = new FreshDao();
		
		List<ProductVo> productList = new ArrayList<ProductVo>();
		productList = dao.selectProductList();
		
		Map<Integer, ProductVo> proMap = new HashMap<Integer, ProductVo>();
		for(ProductVo tempVo : productList) {
			proMap.put(tempVo.getPro_num(), tempVo);
		}
		
		List<CartVo> cartList = new ArrayList<CartVo>();
		cartList = dao.selectCartList();
		
		request.setAttribute("proMap", proMap);
		request.setAttribute("cartList", cartList);
		request.setAttribute("viewPage", viewPage);
	}
	
	@Override
	public void cartDelete(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPage = "/fresh/fresh.do?act=cart";
		
		FreshDao dao = new FreshDao();
		CartVo cartVo = new CartVo();
		String cart_num = (String)request.getParameter("cart_num");
		
		cartVo.setCart_num(Integer.parseInt(cart_num));
		try {
			dao.deleteCart(cartVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("viewPage", viewPage);
	}
}
