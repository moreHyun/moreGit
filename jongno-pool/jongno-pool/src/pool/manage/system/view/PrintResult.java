package pool.manage.system.view;

import java.util.List;

import pool.manage.system.common.MemberDTO;

public class PrintResult {

	public void printMemberList(List<MemberDTO> memberList) {
		for(MemberDTO member : memberList) {
			System.out.println(member);
		}
	}

	public void printMember(MemberDTO member) {
		System.out.println(member);
	}

	
	public void printErrorMessage(String errorCode) {
		String errorMessage = "";
		switch(errorCode) {
		case "selectList" : errorMessage = "회원 목록 조회가 불가능합니다."; break;
		case "selectOne" : errorMessage = "회원 조회가 불가능합니다."; break;
		case "insert" : errorMessage = "신규 회원 등록이 불가능합니다."; break;
		case "update" : errorMessage = "회원 정보 수정이 불가능합니다."; break;
		case "delete" : errorMessage = "회원 정보 삭제를 실패했습니다."; break;
		}
		
		System.out.println(errorMessage);
	}


	public void printSuccessMessage(String successCode) {
		String successMessage = "";
		switch(successCode) {
		case "insert" : successMessage = "신규 회원 등록이 완료되었습니다."; break;
		case "update" : successMessage = "회원 정보 수정이 완료되었습니다."; break;
		case "delete" : successMessage = "회원 정보 삭제를 완료했습니다."; break;
		}
		
		System.out.println(successMessage);
	}

}
