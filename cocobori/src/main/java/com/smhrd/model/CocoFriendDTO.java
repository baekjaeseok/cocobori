package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
// 친구 목록 
public class CocoFriendDTO {

    // 친구 식별자 
    private Double friend_seq;

    // 내 이메일 
    private String user_email;

    // 친구 이메일 
    private String friend_email;

    // 등록 일자 
    private Date uploaded_at;

}