import java.util.List;
import org.sql2o.*;
import java.util.Arrays;

public class Language {
  private int id;
  private String name;
  private String description;
  private String example;
  private String date;
  private String url;

  public Language(String name, String description, String example, String date, String url) {
    this.name = name;
    this.description = description;
    this.example = example;
    this.date = date;
    this.url = url;
  }

  public int getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getDescription() {
    return description;
  }

  public String getExample() {
    return example;
  }

  public String getDate() {
    return date;
  }

  private String getUrl() {
    return url;
  }

  public static List<Language> all() {
    String sql = "SELECT id, name, description, example, date, url FROM languages";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(Language.class);
    }
  }

  @Override
  public boolean equals(Object otherLanguage) {
    if(!(otherLanguage instanceof Language)) {
      return false;
    } else {
      Language newLanguage = (Language) otherLanguage;
      return this.getId() == newLanguage.getId()  && this.getName().equals(newLanguage.getName()) &&
      this.getDescription().equals(newLanguage.getDescription()) &&
      this.getExample().equals(newLanguage.getExample()) &&
      this.getDate().equals(newLanguage.getDate()) &&
      this.getUrl().equals(newLanguage.getUrl());
  }
}

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO languages(name, description, example, date, url) VALUES (:name, :description, :example, :date, :url)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("name", this.name)
      .addParameter("description", this.description)
      .addParameter("example", this.example)
      .addParameter("date", this.date)
      .addParameter("url", this.url)
      .executeUpdate()
      .getKey();
    }
  }

  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String deleteQuery = "DELETE FROM languages WHERE id = :id;";
      con.createQuery(deleteQuery)
      .addParameter("id", this.getId())
      .executeUpdate();

      // String joinDeleteQuery = "DELETE FROM languages_careers WHERE language_id = :language_id";
      // con.createQuery(joinDeleteQuery)
      // .addParameter("language_id", this.getId())
      // .executeUpdate();
    }
  }

  public static Language find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM languages where id = :id";
      Language language = con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetchFirst(Language.class);
      return language;
    }
  }

  public void addProgram(Program newProgram) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO languages_programs (language_id, program_id) VALUES (:language_id, :program_id);";
      con.createQuery(sql)
        .addParameter("language_id", this.id)
        .addParameter("program_id", newProgram.getId())
        .executeUpdate();
    }
  }

  public void addType(Type newType) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO languages_programs (language_id, program_id) VALUES (:language_id, :program_id);";
      con.createQuery(sql)
        .addParameter("language_id", this.id)
        .addParameter("program_id", newType.getId())
        .executeUpdate();
    }
  }

  public List<Program> getPrograms() {
    try(Connection con = DB.sql2o.open()) {
      String joinQuery = "SELECT programs.* FROM languages JOIN languages_programs ON (languages.id = languages_programs.language_id) JOIN programs ON (languages_programs.program_id = programs.id) WHERE languages.id = :id;";
      return con.createQuery(joinQuery)
        .addParameter("id" , this.id)
        .executeAndFetch(Program.class);
    }
  }

}
