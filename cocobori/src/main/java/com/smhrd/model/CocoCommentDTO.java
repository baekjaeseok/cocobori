package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
// 댓글 
public class CocoCommentDTO {

    // 댓글 식볋자 
    private Double cmt_seq;

    // 원글 순번 
    private Double b_seq;

    // 댓글 내용 
    private String cmt_content;

    // 댓글 작성일자 
    private Date uploaded_at;

    // 댓글 작성자 
    private String user_email;

    // 댓글 좋아요수 
    private Double cmt_likes;

}