package dao;

import org.apache.ibatis.session.SqlSession;

public class SearchDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
