package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class database {
	public static Connection connect = null;
	public static Statement s = null;

	public static void db() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String Connection = "jdbc:mysql://localhost/62011270006?useUnicode=true&amp;characterEncoding=UTF-8";
			connect = DriverManager.getConnection(Connection, "root", "");
//			 connect = DriverManager.getConnection("jdbc:mysql://localhost/62011270006" +
//			 "?user=root&password=");
			if (connect != null) {
				System.out.println("Database Connected.");
			} else {
				System.out.println("Database Connect Failed.");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public static void close() {
		// Close
		try {
			if (connect != null) {
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}