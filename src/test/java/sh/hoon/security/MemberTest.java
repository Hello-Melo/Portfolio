package sh.hoon.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	public void test() {
		String str = "1234";
		String str2 = encoder.encode(str);
		
		System.out.println(str2);
		
	}
	
	@Test
	@Ignore
	public void memberInsertTest() {
		String sql =
				"insert into member_tbl(userEmail, userName, userPw, userPhone, userAddr, userAddrD, userBirth, userGender, userStatus, userPass)"
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			for(int i = 0 ; i < 100 ; i++) {
			pstmt.setString(1, "hoon@dream.com");
			pstmt.setString(2, "옥승훈");
			pstmt.setString(3, encoder.encode("1234"));
			pstmt.setString(4, "010-1111-2222");
			pstmt.setString(5, "도량동");
			pstmt.setString(6, "파크맨션");
			pstmt.setString(7,"1987-04-21");
			pstmt.setString(8, "M");
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			
			pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void adminInsertTest2() throws ParseException {
		String sql =
				"insert into member_tbl(userEmail, userName, userPw, userPhone, userAddr, userAddrD, userBirth, userGender, userStatus, userPass)"
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		   String str_date="1987-11-03T12:50:58";
		   DateFormat   formatter = new SimpleDateFormat("yyyy-MM-dd");
		   Date date = (Date)formatter.parse(str_date);
		   java.sql.Date sqlDate2 = new java.sql.Date(date.getTime());
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "admin@dream.com");
			pstmt.setString(2, "관리자");
			pstmt.setString(3, encoder.encode("1234"));
			pstmt.setString(4, "010-1111-2222");
			pstmt.setString(5, "봉곡동");
			pstmt.setString(6, "현대아파트");
			pstmt.setString(7,"1987-11-03");
			pstmt.setString(8, "M");
			pstmt.setInt(9, 3);
			pstmt.setInt(10, 1);

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
