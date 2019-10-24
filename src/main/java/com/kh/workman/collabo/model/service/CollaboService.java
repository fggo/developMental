package com.kh.workman.collabo.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.DataPacket;

public interface CollaboService {

	int createList(DataPacket receive);

	CollaboList selectCollaboListOne(int target);

	List<HashMap> participation(int collaboNo);

}
