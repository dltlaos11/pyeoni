package com.pyeoni.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
					insert into MEMBER values(?,?,?,?,?)
				""";

		conn = OracleUtill.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getEmail());
			pst.setInt(2, mem.getIsAdmin());
			pst.setString(3, mem.getUserName());
			pst.setString(4, mem.getPassword());
			pst.setInt(5, mem.getWithDraw());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}

		return result;
	}
	
	/* 중복체크 */
	public int dupCheck(String email) {
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
				member = new MemberVO(email, re.getInt("isAdmin"),re.getString("userName"), password, re.getInt("withDraw"));
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
	
	/* 회원 정보 수정 */
	public int memUpdate(MemberVO mem) {
		int result = 0;
		String sql = """
				 update member 
				 set username = ? , password = ? 
				 where email = ? 
				""";
		conn = OracleUtill.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getUserName());
			pst.setString(2, mem.getPassword());
			pst.setString(3, mem.getEmail());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
}



































