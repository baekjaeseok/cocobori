package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
// 메시지 관리 
public class CocoMessageDTO {

    // 메시지 식별자 
    private Double msg_seq;

    // 메시지 내용 
    private String msg_content;

    // 발신자 
    private String sender;

    // 수신자 
    private String receiver;

    // 수신 여부 
    private String msg_check;

    // 발신 시간 
    private Date msg_at;

}