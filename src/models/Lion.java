package models;

public class Lion {
	private String chinese;
	private String korean;
	private String mean;
	
	public Lion(String chinese, String korean, String mean) {
		super();
		this.chinese = chinese;
		this.korean = korean;
		this.mean = mean;
	}

	public String getChinese() {
		return chinese;
	}

	public String getKorean() {
		return korean;
	}

	public String getMean() {
		return mean;
	}
	
	public String toString() {
		return chinese+" ["+korean+"] : "+mean;
	}
	
}
