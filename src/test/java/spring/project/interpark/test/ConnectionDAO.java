package spring.project.interpark.test;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConnectionDAO {
	
	@Autowired
	DataSource dataSource;
	public void connect() {
		Connection connection = null;
		try {
			connection = dataSource.getConnection();
			System.out.println(connection + "의 데이터베이스와 연결되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
