package com.kh.workman.collabo.model.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class receiveMessage {
	private int type;
	private String userId;
	//private int collaboNo;
	private double collaboNo;
	private String content;
	private int listNo;
	private int cardNo;
}
