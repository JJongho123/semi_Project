package net.firstpage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.cart.vo.CartVo;

public class ProductDAO {

	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 1. dbcp 연결
	public ProductDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			System.out.println("DB 연결 실패 : " + e);
			return;
		}
	}

	// 2. 상품 추가
	public boolean productInsert(ProductBean productdata) {
		int num = 0;
		String sql = "";

		int result = 0;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement("select max(pro_num) from fresh_product");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			sql = "insert into fresh_product (pro_num, pro_name, pro_kind, pro_price, "
					+ "pro_content, pro_image, USER_ID) " + "values (?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, productdata.getPRO_NAME());
			pstmt.setString(3, productdata.getPRO_KIND());
			pstmt.setInt(4, productdata.getPRO_PRICE());
			pstmt.setString(5, productdata.getPRO_CONTENT());
			pstmt.setString(6, productdata.getPRO_IMAGE());
			pstmt.setString(7, productdata.getUSER_ID());

			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception e) {
			System.out.println("productInsert() 에러 : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	// 3. 상품 목록 보기
	public List<ProductBean> getProductList(int page, int limit, String cond, int num) {

		String product_list_sql = "select * from " + "(select rownum rnum, pro_num, pro_name, pro_kind, "
				+ "pro_price, pro_content, pro_image " + " from (select * from fresh_product order by pro_num asc)) "
				+ " where rnum >= ? and rnum <= ? ";
		if (num == 1) {
			product_list_sql += " order by PRO_PRICE asc";
		} else if (num == 2) {
			product_list_sql += " order by PRO_PRICE desc";
		} else if (num == 3) {
			product_list_sql += " order by PRO_NUM desc";
		}
		String product_list_sql_fmt = "select * from " + "(select rownum rnum, pro_num, pro_name, pro_kind, "
				+ "pro_price, pro_content, pro_image "
				+ " from (select * from fresh_product where %s order by pro_num asc)) "
				+ " where rnum >= ? and rnum <= ? ";
		if (num == 1) {
			product_list_sql_fmt += " order by PRO_PRICE asc";
		} else if (num == 2) {
			product_list_sql_fmt += " order by PRO_PRICE desc";
		} else if (num == 3) {
			product_list_sql_fmt += " order by PRO_NUM desc";
		}

		if (cond != null && !cond.equals("")) {
			product_list_sql = String.format(product_list_sql_fmt, cond);
		}
		// String.format(String, Object):문자열에 있는 하나 이상의 형식 항목을 지정된 개체의 문자열 표현으로 바꿉니다.
		// 서식 문자열의 앞에 %를 붙여 문자열에 사용하면 그 위치에 변수의 값을 형식화 하여 대입 가능하다.

		List<ProductBean> list = new ArrayList<ProductBean>();

		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호

		try {
			con = ds.getConnection();

			// for debug
			System.out.println("getproductList() : " + product_list_sql);

			pstmt = con.prepareStatement(product_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductBean product = new ProductBean();
				product.setPRO_NUM(rs.getInt("PRO_NUM"));
				product.setPRO_NAME(rs.getString("PRO_NAME"));
				product.setPRO_KIND(rs.getString("PRO_KIND"));
				product.setPRO_PRICE(rs.getInt("PRO_PRICE"));
				product.setPRO_CONTENT(rs.getString("PRO_CONTENT"));
				product.setPRO_IMAGE(rs.getString("PRO_IMAGE"));

				list.add(product);
			}
			return list;
		} catch (Exception e) {
			System.out.println("getproductList() 에러 : " + e);
			System.out.println("getproductList() 에러 : " + product_list_sql);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// 4.상품 갯수 구하기
	public int getListCount(String cond) {
		int x = 0;

		String sql = "select count(*) from fresh_product";
		if (cond != null && !cond.equals("")) {
			sql = sql + " where " + cond;
		}
		try {
			con = ds.getConnection();
			System.out.println("getConnection()");

			System.out.println("getListCount() : " + sql);

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount() 에러 : " + e);
			System.out.println("getListCount() 에러 : " + sql);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}

	// 5. 상품정보 카트로 넘기기
	
	  public CartVo getdetailcart(int num, String id) {
	
		CartVo cartvo = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from fresh_product where PRO_NUM = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cartvo = new CartVo();
				cartvo.setUSER_ID(id);
				cartvo.setPRO_NUM(rs.getInt("PRO_NUM"));
				cartvo.setPRO_NAME(rs.getString("PRO_NAME"));
				cartvo.setPRO_KIND(rs.getString("PRO_KIND"));
				cartvo.setPRO_PRICE(rs.getInt("PRO_PRICE"));
				cartvo.setPRO_CONTENT(rs.getString("PRO_CONTENT"));
				cartvo.setPRO_IMAGE(rs.getString("PRO_IMAGE"));
		
			}
			return cartvo;
		} catch (Exception e) {
			System.out.println("getdetailcart 내용보기 실패 : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		return null;
	}


	// 6. 상품 상세정보
	public ProductBean getDetail(int num) {
		ProductBean product = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from fresh_product where PRO_NUM = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new ProductBean();
				product.setPRO_NUM(rs.getInt("PRO_NUM"));
				product.setPRO_NAME(rs.getString("PRO_NAME"));
				product.setPRO_KIND(rs.getString("PRO_KIND"));
				product.setPRO_PRICE(rs.getInt("PRO_PRICE"));
				product.setPRO_CONTENT(rs.getString("PRO_CONTENT"));
				product.setPRO_IMAGE(rs.getString("PRO_IMAGE"));

			}
			return product;
		} catch (Exception e) {
			System.out.println("getDetail 내용보기 실패 : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		return null;
	}

	// 7. 상품 삭제
	public boolean productDelete(int num) {
		String product_delete_sql = "delete from fresh_product where PRO_NUM=?";

		int result = 0;

		// 글삭제 ( 액션 클래스에서 비밀번호 일치 여부 확인후 이 메서드를 수행한다.

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(product_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception e) {
			System.out.println("ProductDelete 삭제 실패 666 : " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
		}
		return false;
	}

	// 8. 상품 정렬
	public List<ProductBean> getSort(int num) {
		List<ProductBean> list = new ArrayList<ProductBean>();

		String sql = "";

		if (num == 1) {
			sql = "select * from fresh_product order by PRO_PRICE asc";
		} else if (num == 2) {
			sql = "select * from fresh_product order by PRO_PRICE desc";
		} else if (num == 3) {
			sql = "select * from fresh_product  order by PRO_NUM desc";
		}
				
		try {
			con = ds.getConnection();
			System.out.println("getConnection()");

			System.out.println("getListCount() : " + sql);

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductBean product = new ProductBean();
				product.setPRO_NUM(rs.getInt("PRO_NUM"));
				product.setPRO_NAME(rs.getString("PRO_NAME"));
				product.setPRO_KIND(rs.getString("PRO_KIND"));
				product.setPRO_PRICE(rs.getInt("PRO_PRICE"));
				product.setPRO_CONTENT(rs.getString("PRO_CONTENT"));
				product.setPRO_IMAGE(rs.getString("PRO_IMAGE"));

				list.add(product);
			}
			return list;

		} catch (Exception e) {
			System.out.println("getSort() 에러 : " + e);
			System.out.println("getSort() 에러 : " + sql);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// 9. 카트테이블에 상품 값들 추가하기

		public boolean cartInsert(CartVo cartvo) {

			int num = 0;

			String sql = "";

			int result = 0;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement("select max(cart_num) from fresh_cart");
				rs = pstmt.executeQuery();

				if (rs.next())
					num = rs.getInt(1) + 1;

				else
					num = 1;

				sql = "insert into fresh_cart (cart_num, cart_quantity, cart_price, cart_seq, ";
				sql += "PRO_NAME, PRO_KIND, PRO_PRICE, PRO_CONTENT, PRO_IMAGE, PRO_SEQ, PRO_NUM, USER_ID) ";
				sql += "values(?,?,?,?,?,?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, 1);
				pstmt.setInt(3, 0);
				pstmt.setInt(4, 0);
				pstmt.setString(5, cartvo.getPRO_NAME());
				pstmt.setString(6, cartvo.getPRO_KIND());
				pstmt.setInt(7, cartvo.getPRO_PRICE());
				pstmt.setString(8, cartvo.getPRO_CONTENT());
				pstmt.setString(9, cartvo.getPRO_IMAGE());
				pstmt.setInt(10, 0);
				pstmt.setInt(11, cartvo.getPRO_NUM());
				pstmt.setString(12, cartvo.getUSER_ID());

				result = pstmt.executeUpdate();
				if (result == 0)
					return false;

				return true;

			} catch (Exception e) {
				System.out.println("boardInsert 등록 실패 : 33" + e);
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException ex) {
					}
			}
			return false;

		}
	// 10. 글수정 메서드~!
	public boolean productModify(ProductBean prodata) throws Exception {

		String sql = "update fresh_product set PRO_NAME=?,";
		sql += "PRO_CONTENT=?, PRO_KIND=? ,PRO_PRICE=? where PRO_NUM=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prodata.getPRO_NAME());
			pstmt.setString(2, prodata.getPRO_CONTENT());
			pstmt.setString(3, prodata.getPRO_KIND());
			pstmt.setInt(4, prodata.getPRO_PRICE());
			pstmt.setInt(5, prodata.getPRO_NUM());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("productModify 쿼리문 수정 실패 555 : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
		}
		return false;

	}

	// 11. admin 아이디가 맞는지 확인
	

	public boolean isBoardWriter(int num, String id) {
		System.out.println("id=" + id);
		String sql = "select * from fresh_product where PRO_NUM=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();

			return true;

		} catch (SQLException e) {
			System.out.println("isBoardWriter 실패 888 : " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
			}

		}
		return false;
	}

	   // 리스트에 값 넣는 거
	   public List<CartVo> getCartList(String id) {
	      String sql = "select * from fresh_cart where user_id = ?";
	      
	      List<CartVo> list = new ArrayList<CartVo>();
	      
	      try {
	         con = ds.getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	      
	         while (rs.next()) {
	            CartVo cartvo = new CartVo();
	            cartvo.setPRO_NUM(rs.getInt("PRO_NUM"));
	            cartvo.setPRO_NAME(rs.getString("PRO_NAME"));
	            cartvo.setPRO_KIND(rs.getString("PRO_KIND"));
	            cartvo.setPRO_PRICE(rs.getInt("PRO_PRICE"));
	            cartvo.setPRO_CONTENT(rs.getString("PRO_CONTENT"));
	            cartvo.setPRO_IMAGE(rs.getString("PRO_IMAGE"));

	            list.add(cartvo);
	         }
	         return list;
	      } catch (SQLException e) {
	         System.out.println("getCartList 실패 888 : " + e);
	      } finally {
	         try {
	            if (pstmt != null)
	               pstmt.close();
	            if (con != null)
	               con.close();
	         } catch (Exception e) {
	         }
	         
	      }
	      return null;
	   }
	   
	   
	   
	

//			// 12. 아이디값 카트테이블에 넣기
//public CartVo getid(String id, int num) {
//	CartVo cartvo = null;
//
//	try {
//		con = ds.getConnection();
//		pstmt = con.prepareStatement("update fresh_cart set USER_ID=? where PRO_NUM=?");
//		pstmt.setString(1, id);
//		pstmt.setInt(2, num);
//
//		rs = pstmt.executeQuery();
//		
//		if (rs.next()) {
//			cartvo = new CartVo();
//			cartvo.setUSER_ID(rs.getString("USER_ID"));
//		}return cartvo;
//	} catch (Exception e) {
//		System.out.println("CartVo getid  id값 update 실패 : " + e);
//	} finally {
//		if (rs != null)
//			try {
//				rs.close();
//			} catch (SQLException e) {
//			}
//		if (pstmt != null)
//			try {
//				pstmt.close();
//			} catch (SQLException e) {
//			}
//		if (con != null)
//			try {
//				con.close();
//			} catch (SQLException e) {
//			}
//	}
//	return null;
//	}
//	
	
	

} 

// 마지막 닫는괄호

// 파일업로드
//public int upload(String fileName, String fileRealName) {
//
//	String SQL = "INSERT INTO FILE VALUES (?, ?)";
//
//	try {
//
//		PreparedStatement pstmt = con.prepareStatement(SQL);
//
//		pstmt.setString(1,  fileName);
//
//		pstmt.setString(2,  fileRealName);
//
//		return pstmt.executeUpdate();
//
//	} catch(Exception e) {
//
//		System.out.println("upload 에러 : " + e);
//
//	}
//
//	return -1;
//
//}
