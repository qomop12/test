package spring.project.interpark.test;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//처리된 클래스를 확장하면 해당 클래스에서 테스트를 실행하기 위해 참조하는 클래스를 호출한다.
@RunWith(SpringJUnit4ClassRunner.class)

//컨텍스트 로더는 경로 기반이나 클래스 기반에 대한 자원인 설정 파일의 위치를 설정한다.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class ConnectionDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(ConnectionDAOTest.class);

	@Autowired
	DataSource dataSource;

	//단위 테스트 메소드를 설정하며 첨부된 public void 메소드가 테스트 케이스로	실행될 수 있음을 알려준다.
	@Test
	public void test( ) { 
		Connection connection = null; 
		try {
		connection = dataSource.getConnection( ); 
		logger.info(""+connection);
		} catch (SQLException e) { 
		e.printStackTrace( );
		}
	}
}
