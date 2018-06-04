package models;

public class Result implements Comparable<Result>{
	private String userID;
	private String date;
	private int score;
	
	public Result(String userID, String date, int score) {
		super();
		this.userID = userID;
		this.date = date;
		this.score = score;
	}
	
	public String getUserID() {
		return userID;
	}
	public String getDate() {
		return date;
	}
	public int getScore() {
		return score;
	}
	
	public String toString() {
		return userID+","+date+","+score;
	}

	@Override
	public int compareTo(Result o2) {
		return this.score - o2.getScore();
	}
}
