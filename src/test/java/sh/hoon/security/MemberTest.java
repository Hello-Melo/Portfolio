package sh.hoon.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;

import sh.hoon.AppTest;

public class MemberTest extends AppTest{

	
	@Autowired
	DataSource dataSource;

	@Autowired
	@Qualifier(value = "bcrayptPwEncoder")
	PasswordEncoder encoder;

	@Test
	@Ignore
	public void memberInsertTest() {
		String sql = "insert into member_tbl(userEmail, userName, userPw) values(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "hoon@dream.com");
			pstmt.setString(2, "옥승훈");
			pstmt.setString(3, encoder.encode("1234"));

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void adminInsertTest2() {
		String sql = "insert into member_tbl(userEmail, userName, userPw) values(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "admin@dream.com");
			pstmt.setString(2, "관리자");
			pstmt.setString(3, encoder.encode("1234"));

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	@Test
	@Ignore
	public void adminInsertTest3() {
		//String sql = "insert into member_tbl(userId, userPw, userName) values(?, ?, ?)";
		//String sql = "update member_tbl set userId = ?,  userPw = ?, userName = ? where userId = 'hong' ";
		String sql = "update member_tbl set userId = 'hong',  userPw = ?, userName = ? where userId='hong' ";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			//pstmt.setString(1, "hong");
			pstmt.setString(1, encoder.encode("1234"));
			pstmt.setString(2, "길동이");

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
