package model.Bean;

public class Level {
	private String idLevel;
	private String levelName;

	public Level(String idLevel, String levelName) {
		super();
		this.idLevel = idLevel;
		this.levelName = levelName;
	}

	public String getIdLevel() {
		return idLevel;
	}

	public void setIdLevel(String idLevel) {
		this.idLevel = idLevel;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

}
