package model.board;

public class BoardVO {
	private int board_id;
	private String title;
	private String board_content;
	private String writedate; // date타입이 아닌 String으로 받을 계획
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", title=" + title + ", board_content="
				+ board_content + ", writedate=" + writedate + "]";
	}
	
}
