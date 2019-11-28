package test;

import java.util.List;

public class Result {

	private int status;
	private String message;
	private List<Place> results;

	public Result() {
		// TODO Auto-generated constructor stub
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<Place> getResults() {
		return results;
	}

	public void setResults(List<Place> results) {
		this.results = results;
	}

	@Override
	public String toString() {
		return "Result [status=" + status + ", message=" + message + ", results=" + results + "]";
	}

}
