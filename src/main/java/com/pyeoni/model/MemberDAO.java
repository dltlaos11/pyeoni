package com.pyeoni.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pyeoni.util.OracleUtill;
import com.pyeoni.vo.MemberVO;

public class MemberDAO {
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet re;
	int result;
	
	/* 회원가입 */
	public int insertMem(MemberVO mem) {
		int result = 0;
		String sql = """
					insert into MEMBER values(?,0,?,?,0)
				""";

		conn = OracleUtill.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getEmail());
			pst.setString(2, mem.getUserName());
			pst.setString(3, mem.getPassword());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}

		return result;
	}
	
	/* email 중복체크 */
	public int emailDupCheck(String email) {
		int count = 0;
		String sql = """
				 select count(*) from member where email = ? 
				""";
		conn = OracleUtill.getConnection();
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			re = pst.executeQuery();
			while(re.next()) {
				count = re.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return count;
	}
	
	/* username 중복체크 */
	public int usernameDupCheck(String username) {
		int count = 0;
		String sql = """
				select count(*) from member where username = ? 
				""";
		conn = OracleUtill.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			re = pst.executeQuery();
			while(re.next()) {
				count = re.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return count;
	}

	
	/* 로그인 */
	public MemberVO login(String email, String password) {
		MemberVO member = null;
		String sql = """
				select * from member where email = ? and password = ? 
				""";
		conn = OracleUtill.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			re = pst.executeQuery();
			while(re.next()) {
				member = new MemberVO(email, re.getInt("is_Admin"),re.getString("userName"), password, re.getInt("withDraw"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return member;
	}
	
	/* 회원탈퇴 */
	public int signout(String email, String password) {
		int result = 0;
		String sql = """
				 UPDATE member SET withdraw = 1 
				 where email = ? and password = ? 
				""";
		conn = OracleUtill.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	public int memUpdate(String password, String email) {
		int result = 0;
		String sql = """
				 update member 
				 set password = ? 
				 where email = ? 
				""";
		conn = OracleUtill.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, email);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	/* 회원 전체 정보 */
	public List<MemberVO> selectAll() {
		String sql = """
				 SELECT * FROM member ORDER BY 1 
				""";
		List<MemberVO> memList = new ArrayList<>();

		conn = OracleUtill.getConnection();
		
		try {
			st = conn.createStatement();
			re = st.executeQuery(sql);
			
			while(re.next()) {
				MemberVO mem = makeMem(re);
				memList.add(mem);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, null);
		}
		
		return memList;
	}
	
	// 계정 복구 or 삭제
	public List<MemberVO> controllLife(String coin, String email){
		String sql = """
				 UPDATE member SET withdraw=? WHERE email=?
				""";
		List<MemberVO> memList = new ArrayList<>();

		conn = OracleUtill.getConnection();
		
		int Coin = Integer.parseInt(coin);
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, Coin);
			pst.setString(2, email);
			
			System.out.println(sql);
			
			result = pst.executeUpdate();
			
			System.out.println("업데이트 결과 "+result);
			
			memList = selectAll();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return memList;
	}

	private MemberVO makeMem(ResultSet re) throws SQLException {
		MemberVO mem = new MemberVO();
		mem.setEmail(re.getString("email"));
		mem.setIsAdmin(re.getInt("is_admin"));
		mem.setUserName(re.getString("userName"));
		mem.setPassword(re.getString("password"));
		mem.setWithDraw(re.getInt("withDraw"));
		
		return mem;
	}
}




































