package net.firstpage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.firstpage.db.ProductBean;
import net.firstpage.db.ProductDAO;

public class ProductAddAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProductDAO  productdao = new ProductDAO();
		ProductBean  productdata = new ProductBean();
		ActionForward  forward = new ActionForward();
		
		String realFolder = "";
		String uploadFolder="/productupload";
		
		int fileSize = 5*1024 * 1024;
		
		String saveFolder = request.getSession().getServletContext().getRealPath(uploadFolder);
		
		System.out.println(saveFolder);
		
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(
					request,
					saveFolder,
					fileSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			
			
			productdata.setPRO_NAME(multi.getParameter("PRO_NAME"));
			productdata.setPRO_KIND(multi.getParameter("PRO_KIND"));
			productdata.setPRO_PRICE(Integer.parseInt(multi.getParameter("PRO_PRICE")));
			productdata.setPRO_CONTENT(multi.getParameter("PRO_CONTENT"));
			productdata.setPRO_IMAGE(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			productdata.setUSER_ID(multi.getParameter("USER_ID"));
			
			result = productdao.productInsert(productdata);
			
			
			
			if (result == false) {
				System.out.println("ProductAddAction 실패");
				return null;
			}
			System.out.println("ProductAddAction 성공");
			
			forward.setRedirect(true);
			forward.setPath("./ProductList.bo");
			return forward;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
		
	}

}
