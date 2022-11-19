package net.login.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
   
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   DataSource ds;
   
   public UserDAO() { // 생성자
      try {
         Context init = new InitialContext();
         ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
      } catch(Exception ex) {
         System.out.println("DB 열결 실패: " + ex);
         return;
      }
   }
   
   // 11.회원
   public int isUser(UserBean user) {
      String sql = "SELECT USER_PW FROM fresh_user WHERE USER_ID=?";
      int result = -1;
      
      try {
         con = ds.getConnection();
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, user.getUSER_ID());
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            if(rs.getString("USER_PW").equals(user.getUSER_PW())) {
               result = 1; // 일치
            } else {
               result = 0; // 불일치
            }
         } else {
            result = -1; // 아이디 존재 하지않음
         }
      } catch (Exception ex) {
         System.out.println("isUser 에러: " + ex);
      } finally {
         if(rs != null) try {rs.close();}catch(SQLException ex) {}
         if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
         if(con != null) try {con.close();}catch(SQLException ex) {}
      }
      return result;
   }
   //아이디 중복확인
   public int joinIdCheck(String userid) {
	      String sql = "SELECT * FROM fresh_user WHERE USER_ID = ?";
	         
	      try {
	            con = ds.getConnection();
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1,  userid);
	            rs = pstmt.executeQuery();
	           
	            if(rs.next()) {
	               return 1;
	            }
	         } catch (Exception ex) {
	            ex.printStackTrace();
	         } finally {
	            if(rs != null) try {rs.close();}catch(SQLException ex) {}
	            if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
	            if(con != null) try {con.close();}catch(SQLException ex) {}
	         }
	         return -1;
	 }
   // 22. 회원 가입
   public boolean joinUser(UserBean user) {
      String sql = "INSERT INTO fresh_user VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      int result = 0;
      
      try {
         con = ds.getConnection();
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, user.getUSER_ID());
         pstmt.setString(2, user.getUSER_PW());
         pstmt.setString(3, user.getUSER_PW2());
         pstmt.setString(4, user.getUSER_NAME());
         pstmt.setString(5, user.getUSER_PHONE1());
         pstmt.setString(6, user.getUSER_PHONE2());
         pstmt.setString(7, user.getUSER_ZIP_CODE());         
         pstmt.setString(8, user.getUSER_ADDR());
         pstmt.setInt(9, user.getUSER_YEAR());
         pstmt.setInt(10, user.getUSER_MONTH());
         pstmt.setInt(11, user.getUSER_DAY());
         pstmt.setString(12, user.getUSER_GENDER());
         pstmt.setString(13, user.getUSER_EMAIL_F());
         pstmt.setString(14, user.getUSER_EMAIL_B());
         pstmt.setString(15, user.getUSER_EMAIL_S());
         result = pstmt.executeUpdate();
         
         if (result != 0) {
            return true;
         }
      } catch (Exception ex) {
         System.out.println("joinUser 에러: 44" + ex);
      } finally {
         if(rs != null) try {rs.close();}catch(SQLException ex) {}
         if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
         if(con != null) try {con.close();}catch(SQLException ex) {}
      }
      return false;
   }
// 업데이트 수정용@@@@@@@@@@@@@@@@@@@@@@@
// 회원 정보 보기
   public UserBean getDetail_user(String id) {
         
      UserBean userbean = null;

         try {
        	 con = ds.getConnection();
 			pstmt = con.prepareStatement("select * from fresh_user where user_id = ?");
 			pstmt.setString(1, id);

 			rs = pstmt.executeQuery();
            
          
            if (rs.next()) {
            	userbean = new UserBean();
            	userbean.setUSER_ID(rs.getString("USER_ID"));
            	userbean.setUSER_PW(rs.getString("USER_PW"));
            	userbean.setUSER_NAME(rs.getString("USER_NAME"));
            	userbean.setUSER_PHONE1(rs.getString("USER_PHONE1"));
            	userbean.setUSER_PHONE2(rs.getString("USER_PHONE2"));
            	userbean.setUSER_ZIP_CODE(rs.getString("USER_ZIP_CODE"));
            	userbean.setUSER_ADDR(rs.getString("USER_ADDR"));
            	userbean.setUSER_YEAR(rs.getInt("USER_YEAR"));
            	userbean.setUSER_MONTH(rs.getInt("USER_MONTH"));
            	userbean.setUSER_DAY(rs.getInt("USER_DAY"));
            	userbean.setUSER_GENDER(rs.getString("USER_GENDER"));
            	userbean.setUSER_EMAIL_F(rs.getString("USER_EMAIL_F"));
            	userbean.setUSER_EMAIL_B(rs.getString("USER_EMAIL_B"));
            	userbean.setUSER_EMAIL_S(rs.getString("USER_EMAIL_S"));
            }
			return userbean;
		} catch (Exception e) {
			
			System.out.println("getDetail22 (정보보기) 내용보기 실패 : " + e);
			System.out.println("getDetail22 실패  id: " + id);
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

  
// 회원 확인
   public boolean isUserWriter(String id) {
      System.out.println("id=" + id);
         String sql = "select * from fresh_user where USER_ID = ?";

         try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            rs.next();

            return true;

         } catch (SQLException e) {
            System.out.println("isUserWriter 실패 888 : " + e);
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

 //회원 정보 수정 예정
   public boolean userModify(UserBean userdata) throws Exception {
 
      String sql = "update fresh_user set USER_NAME=?, USER_PW=?, USER_PHONE1=?, USER_PHONE2=?, USER_ZIP_CODE=?, USER_ADDR=?, USER_EMAIL_F=?, USER_EMAIL_B=?, USER_EMAIL_S=? where USER_ID = ?";
      
    	
      
      try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userdata.getUSER_NAME());
			pstmt.setString(2, userdata.getUSER_PW());
			pstmt.setString(3, userdata.getUSER_PHONE1());
			pstmt.setString(4, userdata.getUSER_PHONE2());
			pstmt.setString(5, userdata.getUSER_ZIP_CODE());
			pstmt.setString(6, userdata.getUSER_ADDR());
			pstmt.setString(7, userdata.getUSER_EMAIL_F());
			pstmt.setString(8, userdata.getUSER_EMAIL_B());
			pstmt.setString(9, userdata.getUSER_EMAIL_S());
			pstmt.setString(10, userdata.getUSER_ID());
			
			pstmt.executeUpdate();
			return true;
			
		}catch (Exception ex) {
         System.out.println("userModify 수정 실패 55 : " + ex);
      }finally {
         if(rs != null) try {rs.close();}catch(SQLException ex) {}
         if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
         if(con != null) try {con.close();}catch(SQLException ex) {}
      }
      return false;
   }

	
}
