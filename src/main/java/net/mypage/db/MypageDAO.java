package net.mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.login.db.UserBean;

public class MypageDAO {
   
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   DataSource ds;
   
   public MypageDAO() { // 생성자
      try {
         Context init = new InitialContext();
         ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
      } catch(Exception ex) {
         System.out.println("DB 열결 실패: " + ex);
         return;
      }
   }

public boolean deleteMember(String id) {

	String board_delete_sql = "delete from fresh_user where user_id=?";
    
    int result=0;
    
    // 글삭제 ( 액션 클래스에서 비밀번호 일치 여부 확인후 이 메서드를 수행한다.
    
    try {
       con = ds.getConnection();
       pstmt=con.prepareStatement(board_delete_sql);
       pstmt.setString(1, id);
       result=pstmt.executeUpdate();
       if(result==0)return false;
       
       return true;
    }catch(Exception e) {
       System.out.println("userDelete 삭제 실패 666 : "+ e);
    }finally {
       try {
          if(pstmt!=null)pstmt.close();
          if(con!=null)con.close();
       }catch(Exception e) {}
    }
    return false;
 }
}
   

//회원 탈퇴

   
  
  
   

