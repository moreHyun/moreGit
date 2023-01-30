package pool.manage.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pool.manage.system.common.MemberDTO;

public interface MemberMapper {

	@Results(id = "memberResultMap", value = {
			@Result(id = true, property = "memberCode", column = "MEMBER_CODE"),
			@Result(property = "memberName", column = "MEMBER_NAME"),
			@Result(property = "classPrice", column = "CLASS_PRICE"),
			@Result(property = "categoryCode", column = "CATEGORY_CODE"),
			@Result(property = "enrollmentStatus", column = "ENROLLMENT_STATUS")
	})
	@Select("SELECT \n" +
	        "       MEMBER_CODE\n" +
			"     , MEMBER_NAME\n" +
	        "     , CLASS_PRICE\n" +
			"     , CATEGORY_CODE\n" +
	        "     , ENROLLMENT_STATUS\n" +
			"  FROM TBL_MEMBER\n" +
	        " WHERE ENROLLMENT_STATUS = 'Y'\n" +
			" ORDER BY MEMBER_CODE")
	List<MemberDTO> selectAllMember();

	@ResultMap("memberResultMap")	//위에서 작성한 resultMap을 다시 사용할 수 있다.
	@Select("SELECT \n" +
	        "       MEMBER_CODE\n" +
			"     , MEMBER_NAME\n" +
	        "     , CLASS_PRICE\n" +
			"     , CATEGORY_CODE\n" +
	        "     , ENROLLMENT_STATUS\n" +
			"  FROM TBL_MEMBER\n" +
	        " WHERE ENROLLMENT_STATUS = 'Y'\n" +
			"   AND MEMBER_CODE = #{ code }")
	MemberDTO selectMemberByCode(int code);

	@Insert("INSERT\n" + 
			"  INTO TBL_MEMBER\n" +
			"(\n" +
			"  MEMBER_CODE\n" +
			", MEMBER_NAME\n" +
			", CLASS_PRICE\n" +
			", CATEGORY_CODE\n" +
			", ENROLLMENT_STATUS\n" +
			")\n" +
			"VALUES\n" +
			"(\n" +
			"  SEQ_MEMBER_CODE.NEXTVAL\n" +
			", #{ memberName }\n" +
			", #{ classPrice }\n" +
			", #{ categoryCode }\n" +
			", 'Y'\n" +
			")")
	int insertMember(MemberDTO member);

	@Update("UPDATE\n" +
			"       TBL_MEMBER\n" + 
			"   SET MEMBER_NAME = #{ memberName }\n" + 
			"     , CLASS_PRICE = #{ classPrice }\n" +
			"     , CATEGORY_CODE = #{ categoryCode }\n" +
			" WHERE MEMBER_CODE = #{ memberCode }")
	int updateMember(MemberDTO member);

	@Delete("DELETE\n" + 
			"  FROM TBL_MEMBER\n" +
			" WHERE MEMBER_CODE = #{ code }")
	int deleteMember(int code);

	
	
	
	
	
	
	
	
	
}

