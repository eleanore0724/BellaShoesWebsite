package tw.com.lccnet.databaseutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtils {
	private String JDBC_DRIVER="com.mysql.cj.jdbc.Driver"; //JDBC Driver
	private String JDBC_URL="jdbc:mysql://127.0.0.1:3306/bella_shoes"; //JDBC 連接路徑(本機)
	private String JDBC_USERNAME="root"; //資料庫帳號
	private String JDBC_PASSWORD="Aa890724"; //資料庫密碼
	private Connection conn; //JDBC 連接類
	
	//建構子
	public DBUtils() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//靜態方法
	public static DBUtils getDataBase() {
		return new DBUtils();
	}
	
	// 調用資料庫連接
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/* close 多個方法 */
	public void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void ps(PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void close(Statement st) {
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
