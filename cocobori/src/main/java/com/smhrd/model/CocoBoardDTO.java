package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
// 게시판 
public class CocoBoardDTO {
	
    // 글 순번(식별자) 
	private int b_seq;


    // 글 내용 
    @NonNull private String b_content;

    // 글 첨부파일 
    @NonNull private String b_file;

    // 글 작성일자 
    private Date uploaded_at;

    // 글 작성자 
    @NonNull private String user_email;

    // 글 조회수 
    @NonNull private int b_views;

    // 글 좋아요 수 
    @NonNull private int b_likes;

}