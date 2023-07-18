package com.hp.app.account.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.account.vo.AccountVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class AccountDaoImpl implements AccountDao{

	@Override
	public List<AccountVo> list(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectList("account.list", vo);
	}
	
	@Override
	public int add(SqlSessionTemplate sst, AccountVo vo) {
		return sst.insert("account.add", vo);
	}

	@Override
	public AccountVo detail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("account.selectByNo", no);
	}

	@Override
	public int edit(SqlSessionTemplate sst, AccountVo vo) {
		return sst.update("account.edit", vo);
	}

	@Override
	public int delete(SqlSessionTemplate sst, AccountVo vo) {
		return sst.update("account.del", vo.getNo());
	}

	
	

}
