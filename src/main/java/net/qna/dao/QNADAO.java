package net.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.qna.vo.QNAVO;

public class QNADAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public QNADAO() { // 생성자
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결에 실패하였습니다. " + ex);
			return;
		}
	}

	// 게시글 수
	public int getListCount() {
		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from fresh_qna");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 실패 : " + ex);
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
		return x;
	}

	// 게시판 레코드를 읽어옴
	public List getQnaList(int page, int limit) {
		String qna_list_sql = "select * from " + "(select rownum rnum,QNA_NUM,QNA_ID,QNA_SUBJECT,"
				+ "QNA_CONTENT,QNA_FILE,QNA_RE_REF,QNA_RE_LEV,"
				+ "QNA_RE_SEQ,QNA_READCOUNT,QNA_DATE from " + "(select * from fresh_qna order by "
				+ "QNA_RE_REF desc,QNA_RE_SEQ asc)) " + "where rnum>=? and rnum<=?";

		List list = new ArrayList();

		int startrow = (page - 1) * 10 + 1; //
		int endrow = startrow + limit - 1; //
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(qna_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				QNAVO qna = new QNAVO();
				qna.setQNA_NUM(rs.getInt("QNA_NUM"));
				qna.setQNA_ID(rs.getString("QNA_ID"));
				qna.setQNA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQNA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQNA_FILE(rs.getString("QNA_FILE"));
				qna.setQNA_RE_REF(rs.getInt("QNA_RE_REF"));
				qna.setQNA_RE_LEV(rs.getInt("QNA_RE_LEV"));
				qna.setQNA_RE_SEQ(rs.getInt("QNA_RE_SEQ"));
				qna.setQNA_READCOUNT(rs.getInt("QNA_READCOUNT"));
				//qna.setQNA_DATE(rs.getDate("QNA_DATE"));
				list.add(qna);
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getQnaList 읽어오기 실패 3: " + ex);
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
		return null;
	}

	// 게시판 글쓰기 333
	public boolean qnaInsert(QNAVO qna) {
		int num = 0;
		String sql = "";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(qna_num) from fresh_qna");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into fresh_qna (QNA_NUM,QNA_ID,QNA_SUBJECT,";
			sql += "QNA_CONTENT, QNA_FILE,QNA_RE_REF," + "QNA_RE_LEV,QNA_RE_SEQ,QNA_READCOUNT,"
					+ "QNA_DATE) values(?,?,?,?,?,?,?,?,?,sysdate)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qna.getQNA_ID());
			pstmt.setString(3, qna.getQNA_SUBJECT());
			pstmt.setString(4, qna.getQNA_CONTENT());
			pstmt.setString(5, qna.getQNA_FILE());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);

			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;

		} catch (Exception e) {
			System.out.println("qnaInsert 등록 실패 : 33" + e);
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
	// 글을 읽는 갯수 , 조회수 update(글내용 확인 순간 호출된다)
	public void setReadCountUpdate(int num) {
		String sql = "update fresh_qna set QNA_READCOUNT = "+
					"QNA_READCOUNT+1 where QNA_NUM = "+num;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("setReadCountUpdate 글 읽은 갯수 수정 실패 777 : " + e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e) {
				
			}
		}
	}
	// 내용보기
	public QNAVO getDetail(int num) {
		QNAVO qna = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(
					"select * from fresh_qna where QNA_NUM = ?");
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				qna = new QNAVO();
				qna.setQNA_NUM(rs.getInt("QNA_NUM"));
				qna.setQNA_ID(rs.getString("QNA_ID"));
				qna.setQNA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQNA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQNA_FILE(rs.getString("QNA_FILE"));
				qna.setQNA_RE_REF(rs.getInt("QNA_RE_REF"));
				qna.setQNA_RE_LEV(rs.getInt("QNA_RE_LEV"));
				qna.setQNA_RE_SEQ(rs.getInt("QNA_RE_SEQ"));
				qna.setQNA_READCOUNT(rs.getInt("QNA_READCOUNT"));
				//qna.setQNA_DATE(rs.getDate("QNA_DATE"));
				
			}
			return qna;
		}catch(Exception e) {
			System.out.println("getDetail 내용보기 실패 : " + e);
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(con!=null)try {con.close();}catch(SQLException e) {}
		}
		return null;
					
	}
	// 답글 44
	public int qnaReply(QNAVO qna) {
		String qna_max_sql="select max(qna_num) from fresh_qna";
		String sql="";
		int num=0;
		int result=0;
		
		int re_ref = qna.getQNA_RE_REF(); // 원본글 번호
		int re_lev = qna.getQNA_RE_LEV(); // 답변글의 깊이
		int re_seq = qna.getQNA_RE_SEQ(); // 답변글의 순서
		
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement(qna_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num = rs.getInt(1)+1;
			else num=1;
			
			sql="update fresh_qna set QNA_RE_SEQ=QNA_RE_SEQ+1 ";
			sql+="where QNA_RE_REF=? and QNA_RE_SEQ > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			result=pstmt.executeUpdate();
			
			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
			
			sql="insert into fresh_qna (QNA_NUM,QNA_ID,QNA_SUBJECT,";
			sql+="QNA_CONTENT,QNA_FILE,QNA_RE_REF,QNA_RE_LEV,";
			sql+="QNA_RE_SEQ,QNA_READCOUNT,QNA_DATE) ";
			sql+="values(?,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qna.getQNA_ID());
			pstmt.setString(3, qna.getQNA_SUBJECT());
			pstmt.setString(4, qna.getQNA_CONTENT());
			pstmt.setString(5, ""); // file 은 등록 필요없다
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			pstmt.setInt(9, 0);
			pstmt.executeUpdate();
			return num;
			
		}catch(SQLException e) {
			System.out.println("qnaReply 답변 실패 44:"+ e);
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(con!=null)try {con.close();}catch(SQLException e) {}
		}
		return 0;
		
	}
	// 넘버에 해당하는 글쓴 사람 비교 
	// 글쓴이를 확인할 글의 정보를 얻는다.
	public boolean isQnaWriter(int num, String id) {
		System.out.println("id="+ id);
		String qna_sql= "select * from fresh_qna where QNA_NUM=?";
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(qna_sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			rs.next();
			
			if(id.equals(rs.getString("QNA_ID"))) {
				return true;
			}
			
		}catch(SQLException e) {
			System.out.println("isQnaWriter 실패 888 : " + e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e) {}
				
		}
			return false;
			
	}
	
	// 글 수정 555.
	public boolean qnaModify(QNAVO modifyqna) throws Exception{
		String sql="update fresh_qna set QNA_SUBJECT=?,";
		sql += "QNA_CONTENT=? where QNA_NUM=?";
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyqna.getQNA_SUBJECT());
			pstmt.setString(2, modifyqna.getQNA_CONTENT());
			pstmt.setInt(3, modifyqna.getQNA_NUM());
			pstmt.executeUpdate();
			return true;
		}catch(Exception e) {
			System.out.println("qnadModify 수정 실패 555 : "+ e);
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null)try {rs.close();}catch(SQLException e) {}
			if(con!=null)try {rs.close();}catch(SQLException e) {}
		}
		return false;
					
	
	}
		// 글삭제 666.
	public boolean qnaDelete(int num) {
		String qna_delete_sql = "delete from fresh_qna where QNA_num=?";
		
		int result=0;
		
		// 글삭제 ( 액션 클래스에서 비밀번호 일치 여부 확인후 이 메서드를 수행한다.
		
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement(qna_delete_sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			if(result==0)return false;
			
			return true;
		}catch(Exception e) {
			System.out.println("qnaDelete 삭제 실패 666 : "+ e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e) {}
		}
		return false;
	}
}