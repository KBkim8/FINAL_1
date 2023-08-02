package com.hp.app.chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatRoomVo;

public interface ChatDao {

	// 회원 별 채팅방 목록 조회
	List<ChatRoomVo> selectRoom(SqlSessionTemplate sst, String mno);

	// 채팅방 상세조회
	List<ChatRoomVo> chatDetailByNo(SqlSessionTemplate sst, ChatRoomVo vo);

	// 채팅방 친구 목록
	List<ChatFriendVo> friendList(SqlSessionTemplate sst, Map<String, String> paramMap);

}
