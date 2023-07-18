package com.hp.app.account.service;

import java.util.List;

import com.hp.app.account.vo.AccountVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

public interface AccountService {

	// 회원별 가계부 목록 조회
	List<AccountVo> list(MemberVo vo, PageVo pv);
	
	// 회원별 가계부 글 개수
	int listCnt(MemberVo vo);
	
	// 가계부 추가
	int add(AccountVo vo);
	
	// 가계부 상세조회
	AccountVo detail(String no);
	
	// 가계부 수정
	int edit(AccountVo vo);
	
	// 가계부 삭제
	int delete(AccountVo vo);

	
	
}
