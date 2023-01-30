package pool.manage.system.controller;

import java.util.List;
import java.util.Map;

import pool.manage.system.common.MemberDTO;
import pool.manage.system.service.MemberService;
import pool.manage.system.view.PrintResult;

public class MemberController {
	
	private final MemberService memberService;
	private final PrintResult printResult;
	
	public MemberController() {
		memberService = new MemberService();
		printResult = new PrintResult();
	}
	

	public void selectAllMember() {
		
		List<MemberDTO> memberList = memberService.selectAllMember();
		
		if(memberList != null) {
			printResult.printMemberList(memberList);
		} else {
			printResult.printErrorMessage("selectList");
		}
	}

	
	public void selectMemberByCode(Map<String, String> parameter) {

		int code = Integer.parseInt(parameter.get("code"));
		
		MemberDTO member = memberService.selectMemberByCode(code);
		
		if(member != null) {
			printResult.printMember(member);
		} else {
			printResult.printErrorMessage("selectOne");
		}
		
	}

	
	public void insertMember(Map<String, String> parameter) {
		
		MemberDTO member = new MemberDTO();
		member.setMemberName(parameter.get("name"));
		member.setClassPrice(Integer.parseInt(parameter.get("price")));
		member.setCategoryCode(Integer.parseInt(parameter.get("categoryCode")));
		
		if(memberService.insertMember(member)) {
			printResult.printSuccessMessage("insert");
		} else {
			printResult.printErrorMessage("insert");
		}
	}

	
	public void updateMember(Map<String, String> parameter) {
		
		MemberDTO member = new MemberDTO();
		member.setMemberCode(Integer.parseInt(parameter.get("code")));
		member.setMemberName(parameter.get("name"));
		member.setClassPrice(Integer.parseInt(parameter.get("price")));
		member.setCategoryCode(Integer.parseInt(parameter.get("categoryCode")));
		
		if(memberService.updateMember(member)) {
			printResult.printSuccessMessage("update");
		} else {
			printResult.printErrorMessage("update");
		}
		
	}

	
	public void deleteMember(Map<String, String> parameter) {
		
		int code = Integer.parseInt(parameter.get("code"));
		
		if(memberService.deleteMember(code)) {
			printResult.printSuccessMessage("delete");
		} else {
			printResult.printErrorMessage("delete");
		}
	}

}
