package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
// 채팅방 
public class CocoChatroomDTO {

    // 채팅방 식별자 
    private Double cr_seq;

    // 채팅방 제목 
    private String cr_title;

    // 채팅방 내용 
    private String cr_description;

    // 채팅방 개설자 
    private String user_email;

    // 채팅방 개설일자 
    private Date cr_at;

    // 채팅방 인원수 
    private Double cr_limit;

}