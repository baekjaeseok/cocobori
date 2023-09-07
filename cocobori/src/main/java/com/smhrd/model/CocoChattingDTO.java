package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class CocoChattingDTO {

    // 채팅 순번 
    private Double CHAT_SEQ;

    // 채팅방 순번 
    @NonNull private Double CR_SEQ;

    // 발화자 
    @NonNull private String TALKER;

    // 발화 내용 
    @NonNull private String TALKING;

    // 발화 시간 
    private String TALKING_AT;

}