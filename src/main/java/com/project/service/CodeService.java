package com.project.service;

import java.util.List;

import com.project.common.domain.CodeLabelValue;

public interface CodeService {
	// 그룹코드 목록 조회 
	public List<CodeLabelValue> getCodeGroupList() throws Exception;

	// 지정된 그룹코드에 해당하는 코드 목록 조회 
	public List<CodeLabelValue> getCodeList(String groupCode) throws Exception;

	//코드라벨등록처리요청 추상메소드 
	
	
	//코드라벨 상세 페이지 
	
	
	// 삭제 처리 
	
	
	// 수정 처리 
	
}
