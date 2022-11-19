package net.cart.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.cart.vo.CartVo;
import net.cart.vo.ProductVo; 

public class FreshDao {	
	public List<ProductVo> selectProductList() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		List<ProductVo> productList = new ArrayList<ProductVo>();
		try{
			connection = getConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * FROM FRESH_PRODUCT	\n");
			sql.append("WHERE 1=1				\n");
			
			preparedStatement = connection.prepareStatement(sql.toString());
			resultSet = preparedStatement.executeQuery();
			System.out.println(resultSet);
			while(resultSet.next()){
				ProductVo tempVo = new ProductVo();
				tempVo.setPro_num(resultSet.getInt("pro_num"));
				tempVo.setPro_name(resultSet.getString("pro_name"));
				tempVo.setPro_kind(resultSet.getString("pro_kind"));
				tempVo.setPro_price(resultSet.getInt("pro_price"));
				tempVo.setPro_content(resultSet.getString("pro_content"));
				tempVo.setPro_image(resultSet.getString("pro_image"));
				tempVo.setPro_seq(resultSet.getInt("pro_seq"));
				
				productList.add(tempVo);
			}
		}catch(SQLException e){
		}finally{
			//DB 작업 종료 후 statement과 resultSet,connection을 종료
			// 작업이 끝난 후 각 프로세스가 남아있는것을 방지하기 위함
			if(resultSet!=null){try{resultSet.close();}catch(Exception e){}}
			if(preparedStatement!=null){try{preparedStatement.close();}catch(Exception e){}}
			if(connection!=null){try{connection.close();}catch(Exception e){}}
		}
		return productList;
	}
	
	public int deleteCart(CartVo cartVo) throws Exception{
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		try{
			connection = getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM FRESH_CART	\n");
			sql.append("WHERE CART_NUM = ?		\n");
			
			pstmt = connection.prepareStatement(sql.toString());	
			pstmt.setInt(1, cartVo.getCart_num());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println(e);
		}finally{
			//DB 작업 종료 후 statement 들과 resultSet,connection 을 종료
			// 작업이 끝난 후 각 프로세스가 남아있는것을 방지하기 위함
			if(pstmt!=null){try{pstmt.close();}catch(Exception e){}}
			if(connection!=null){try{connection.close();}catch(Exception e){}}
		}
		return result;
	}
	
	public List<CartVo> selectCartList() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		List<CartVo> cartList = new ArrayList<CartVo>();
		try{
			connection = getConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * FROM FRESH_CART	\n");
			sql.append("WHERE 1=1				\n");
			
			preparedStatement = connection.prepareStatement(sql.toString());
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				CartVo tempVo = new CartVo();
				tempVo.setCart_num(resultSet.getInt("cart_num"));
				tempVo.setPRO_NUM(resultSet.getInt("pro_num"));
				tempVo.setCart_quantity(resultSet.getInt("cart_quantity"));
				tempVo.setCart_price(resultSet.getInt("cart_price"));
				tempVo.setCart_seq(resultSet.getInt("cart_seq"));
				
				cartList.add(tempVo);
			}
		}catch(SQLException e){
		}finally{
			//DB 작업 종료 후 statement과 resultSet,connection 을 종료
			// 작업이 끝난 후 각 프로세스가 남아있는것을 방지하기 위함
			if(resultSet!=null){try{resultSet.close();}catch(Exception e){}}
			if(preparedStatement!=null){try{preparedStatement.close();}catch(Exception e){}}
			if(connection!=null){try{connection.close();}catch(Exception e){}}
		}
		return cartList;
	}
	
	public Connection getConnection() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e){
			e.printStackTrace();
		}
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "scott";
		String password = "tiger";
		
		Connection connection = null;
		try{
			connection = DriverManager.getConnection(url,user, password);
		}catch(SQLException e){
			System.out.println(e);
		}
		return connection;
	}
}
