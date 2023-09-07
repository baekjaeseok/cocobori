package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class CocoQuestionDTO {
	
	private String num;
	private String title;
	private String type;
	private String writer;
	private String content;
	private String q_file;
	private String q_date;
	private String answer;
	
}