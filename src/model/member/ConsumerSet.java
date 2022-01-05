package model.member;

public class ConsumerSet {
	private MemberVO mvo;
	private ConsumerVO cvo;
	
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	public ConsumerVO getCvo() {
		return cvo;
	}
	public void setCvo(ConsumerVO cvo) {
		this.cvo = cvo;
	}
	@Override
	public String toString() {
		return "ConsumerSet [mvo=" + mvo + ", cvo=" + cvo + "]";
	}
	
}
