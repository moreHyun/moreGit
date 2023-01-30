package pool.manage.system.view;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import pool.manage.system.controller.MemberController;

public class Application {

	public static void main(String[] args) {
		
		
		Scanner sc = new Scanner(System.in);
		MemberController memberController = new MemberController();
		
		do {
			System.out.println("===== 종로 수영센터 회원 관리 시스템 =====");
			System.out.println("1. 회원 목록 전체 조회");
			System.out.println("2. 회원 번호를 이용한 회원 조회");
			System.out.println("3. 신규 회원 등록");
			System.out.println("4. 회원 정보 수정");
			System.out.println("5. 회원 정보 삭제");
			System.out.print("관리 시스템 번호 입력 : ");
			int no = sc.nextInt();
			
			switch(no) {
			case 1: memberController.selectAllMember(); break;
			case 2: memberController.selectMemberByCode(inputMemberCode()); break;
			case 3: memberController.insertMember(inputInsertMember()); break;
			case 4: memberController.updateMember(inputUpdateMember()); break;
			case 5: memberController.deleteMember(inputMemberCode()); break;
			default: System.out.println("올바른 번호를 입력하세요.");
			}

		} while(true);
		
	}

	private static Map<String, String> inputMemberCode() {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("회원 번호 입력 : ");
		String code = sc.nextLine();
		
		Map<String, String> parameter = new HashMap<>();
		parameter.put("code", code);
		
		return parameter;
	}
	
	private static Map<String, String> inputInsertMember() {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("회원명 : ");
		String name = sc.nextLine();
		System.out.print("수업료 : ");
		String price = sc.nextLine();
		System.out.print("카테고리 코드 : ");
		String categoryCode = sc.nextLine();
		
		Map<String, String> parameter = new HashMap<>();
		parameter.put("name", name);
		parameter.put("price", price);
		parameter.put("categoryCode", categoryCode);
		
		return parameter;
	}

	private static Map<String, String> inputUpdateMember() {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("회원 번호 수정 : ");
		String code = sc.nextLine();
		System.out.print("회원 성명 수정 : ");
		String name = sc.nextLine();
		System.out.print("수업료 수정 : ");
		String price = sc.nextLine();
		System.out.print("카테고리 수정 : ");
		String categoryCode = sc.nextLine();
		
		Map<String, String> parameter = new HashMap<>();
		parameter.put("code", code);
		parameter.put("name", name);
		parameter.put("price", price);
		parameter.put("categoryCode", categoryCode);
		
		return parameter;
	}

}
