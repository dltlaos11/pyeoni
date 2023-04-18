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
}
