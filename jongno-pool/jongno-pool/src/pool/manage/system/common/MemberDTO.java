package pool.manage.system.common;

public class MemberDTO {
	
	private int memberCode;
	private String memberName;
	private int classPrice;
	private int categoryCode;
	private String enrollmentStatus;
	
	public MemberDTO() {}

	public MemberDTO(int memberCode, String memberName, int classPrice, int categoryCode, String enrollmentStatus) {
		super();
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.classPrice = classPrice;
		this.categoryCode = categoryCode;
		this.enrollmentStatus = enrollmentStatus;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getClassPrice() {
		return classPrice;
	}

	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getEnrollmentStatus() {
		return enrollmentStatus;
	}

	public void setEnrollmentStatus(String enrollmentStatus) {
		this.enrollmentStatus = enrollmentStatus;
	}

	@Override
	public String toString() {
		return "MemberDTO [memberCode=" + memberCode + ", memberName=" + memberName + ", classPrice=" + classPrice
				+ ", categoryCode=" + categoryCode + ", enrollmentStatus=" + enrollmentStatus + "]";
	}
	
	

}
