package com.pyeoni.controller;

import java.util.Map;

public interface CommonControllerInterface {// 모든 컨트롤러의 규격서
	public String execute(Map<String, Object>data) throws Exception;

}
