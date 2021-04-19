package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;



public class customer {
	public static Connection connect = null;
	public static Statement s = null;

	public static void db() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String Connection = "jdbc:mysql://localhost/62011270006?useUnicode=true&amp;characterEncoding=UTF-8";
			connect = DriverManager.getConnection(Connection, "root", "");

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

	public static int add(String memName, String memSur, String phone, String address, String email, String password) {
		
		try {
			db();
			s = connect.createStatement();
			String sql = "INSERT INTO member (memName, memSur, Phone,Email,Password,Address)VALUES" + "('" + memName
					+ "','" + memSur + "','" + phone + "','" + email + "','" + password + "','" + address + "')";
			s.execute(sql);
		return 1;
		} catch (Exception e) {
			// false
		return 0;

		}
		
	}

}

