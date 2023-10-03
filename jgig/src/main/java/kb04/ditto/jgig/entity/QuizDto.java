package kb04.ditto.jgig.entity;

public class QuizDto {
	private String mem_id;
	private String quiz_stat;
	private String quiz_date;
	private int my_answer;
	private int answer;

	public QuizDto() {
	}

	public QuizDto(String mem_id, String quiz_stat, String quiz_date, int my_answer, int answer) {
		super();
		this.mem_id = mem_id;
		this.quiz_stat = quiz_stat;
		this.quiz_date = quiz_date;
		this.my_answer = my_answer;
		this.answer = answer;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getQuiz_stat() {
		return quiz_stat;
	}

	public void setQuiz_stat(String quiz_stat) {
		this.quiz_stat = quiz_stat;
	}

	public String getQuiz_date() {
		return quiz_date;
	}

	public void setQuiz_date(String quiz_date) {
		this.quiz_date = quiz_date;
	}

	public int getMy_answer() {
		return my_answer;
	}

	public void setMy_answer(int my_answer) {
		this.my_answer = my_answer;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "QuizDto [mem_id=" + mem_id + ", quiz_stat=" + quiz_stat + ", quiz_date=" + quiz_date + ", my_answer="
				+ my_answer + ", answer=" + answer + "]";
	}

}
