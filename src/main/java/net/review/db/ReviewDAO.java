package net.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public ReviewDAO() { // 생성자
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결에 실패하였습니다. " + ex);
			return;
		}
	}

	//게시글 수
	public int getListCount() {
		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from FRESH_REVIEW");
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
	
	// 리뷰 게시판 코드를 읽어옴
	public List<ReviewBean> getBoardList(int page, int limit) {
		String review_list_sql = "select * from " + "(select rownum rnum,REVIEW_NUM,REVIEW_ID,REVIEW_SUBJECT,"
				+ "REVIEW_CONTENT,REVIEW_IMAGE,READCOUNT,REVIEW_DATE from " 
				+ "(select * from FRESH_REVIEW order by REVIEW_NUM desc)) "
				 + "where rnum>=? and rnum<=?";

		List<ReviewBean> list = new ArrayList<ReviewBean>();

		int startrow = (page - 1) * 10 + 1; //
		int endrow = startrow + limit - 1; //
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(review_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_ID(rs.getString("REVIEW_ID"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_IMAGE(rs.getString("REVIEW_IMAGE"));
				review.setREADCOUNT(rs.getInt("READCOUNT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				list.add(review);
			}
			System.out.println("리스트값 받았다~!~!~!~!~~!~!~!");
			return list;
		} catch (Exception ex) {
			System.out.println("getReviewList 읽어오기 실패 : " + ex);
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
	//게시글 등록
	public boolean boardInsert(ReviewBean reviewdata) {
		int num = 0;
		String sql = "";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(review_num) from FRESH_REVIEW");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into FRESH_REVIEW (REVIEW_NUM,REVIEW_ID,REVIEW_SUBJECT,";
			sql += "REVIEW_CONTENT,REVIEW_IMAGE, " + "READCOUNT,REVIEW_DATE) values(?,?,?,?,?,?,sysdate)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, reviewdata.getREVIEW_ID());
			pstmt.setString(3, reviewdata.getREVIEW_SUBJECT());
			pstmt.setString(4, reviewdata.getREVIEW_CONTENT());
			pstmt.setString(5, reviewdata.getREVIEW_IMAGE());
			pstmt.setInt(6,0);

			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardInsert 등록 실패 : 33" + ex);
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
	//조회수
	public void setReadCountUpdate(int num) {
		String sql = "update fresh_review set READCOUNT = " + "READCOUNT+1 where REVIEW_NUM = " + num;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("setReadCountUpdate 글 읽은 개수 수정 실패 77 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
	}
	//게시글 상세 보기
	public ReviewBean getDetail(int num) {
		ReviewBean board = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from FRESH_REVIEW where REVIEW_NUM = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new ReviewBean();
				board.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				board.setREVIEW_ID(rs.getString("REVIEW_ID"));
				board.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				board.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				board.setREVIEW_IMAGE(rs.getString("REVIEW_IMAGE"));
				board.setREADCOUNT(rs.getInt("READCOUNT"));
				board.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
			}
			return board;
		} catch (Exception ex) {
			System.out.println("getDetail 내용 보기 실패 : " + ex);
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
	
	//글쓴이인지 확인
	public boolean isBoardWriter(int num, String id) {
		System.out.println("id=" + id);
		String board_sql = "select * from FRESH_REVIEW where REVIEW_NUM = ?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();

			if (id.equals(rs.getString("REVIEW_ID"))) {
				return true;
			}
		} catch (Exception ex) {
			System.out.println("아이디 비교 실패  : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return false;
	}
	//리뷰게시글 수정
	public boolean ReviewModify(ReviewBean reviewdata) {
		String sql = "update FRESH_REVIEW set REVIEW_SUBJECT=?,";
		sql += "REVIEW_CONTENT=? where REVIEW_NUM=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewdata.getREVIEW_SUBJECT());
			pstmt.setString(2, reviewdata.getREVIEW_CONTENT());
			pstmt.setInt(3, reviewdata.getREVIEW_NUM());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			System.out.println("reviewModify 수정 실패 : " + ex);
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

	public boolean reviewDelete(int num) {
		String board_delete_sql=
				"delete from FRESH_REVIEW where REVIEW_NUM = ?";
		
		int result;
		
		//글삭제 (액션 클래스에서 비밀번호 일치 여부 확인후 이메서드를 수행)
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1,  num);
			result = pstmt.executeUpdate();
			if (result == 0) return false;
			
			return true;
		} catch (Exception ex) {
			System.out.println("ReviewDelete 삭제 실패  +" + ex);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception ex) {}
		}
	return false;
}
	

	

	
}