package com.project.common.domain;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor 
@Data
public class CodeLabelValue {
	private final String value; //group code
	private final String label; //group name
}
