package net.cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FreshDao {   
      Connection con;
      PreparedStatement pstmt;
      ResultSet rs;
      DataSource ds;
      
      public FreshDao() {
         try {
            Context init = new InitialContext();
            ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
         } catch (Exception e) {
            System.out.println("DB 연결 실패 : " + e);
            return;
         }
      }

   
   public boolean CartDelete(int num) {
         String cart_delete_sql = "delete from fresh_cart where cart_num=?";
         
         int result=0;
         
         try {
            con = ds.getConnection();
            pstmt=con.prepareStatement(cart_delete_sql);
            pstmt.setInt(1, num);
            result=pstmt.executeUpdate();
            if(result==0)return false;
            
            return true;
         }catch(Exception e) {
            System.out.println("CartDelete 삭제 실패 : "+ e);
         }finally {
            try {
               if(pstmt!=null)pstmt.close();
               if(con!=null)con.close();
            }catch(Exception e) {}
         }
         return false;
      }
}
