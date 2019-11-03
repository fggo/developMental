package com.kh.workman.collabo.model.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class DataPacket {
	private String type;
	private String userId;
	private String method;
	private int collaboNo;
	private String content;
	private int listNo;
	private int cardNo;
	private int placeNo;
	private int targetNo;
}
