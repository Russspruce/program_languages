import java.util.ArrayList;
import java.util.List;
import org.sql2o.*;

public class Program {
  private String name;
  private String description;
  private String url;
  private int id;

  public Program (String name, String description, String url) {
    this.name = name;
    this.description = description;
    this.url = url;
  }

  public String getName() {
    return name;
  }

  public String getDescription() {
    return description;
  }

  public String getUrl() {
    return url;
  }

  public int getId() {
    return id;
  }

  public static List<Program> all() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM programs;";
      return con.createQuery(sql)
        .executeAndFetch(Program.class);
    }
  }

  @Override
  public boolean equals(Object otherProgram) {
    if(!(otherProgram instanceof Program)) {
      return false;
    } else {
      Program newProgram = (Program) otherProgram;
      return newProgram.getName().equals(this.name) &&
        newProgram.getDescription().equals(this.description) &&
        newProgram.getUrl().equals(this.url) &&
        newProgram.getId() == this.id;
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO programs (name, description, url) VALUES (:name, :description, :url);";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .addParameter("description", this.description)        .addParameter("url", this.url)
        .executeUpdate()
        .getKey();
    }
  }

  public static Program find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM programs WHERE id = :id;";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Program.class);
    }
  }

  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String deleteProgram = "DELETE FROM programs WHERE id = :id;";
      con.createQuery(deleteProgram)
        .addParameter("id", id)
        .executeUpdate();

      String deleteJoin = "DELETE FROM languages_programs WHERE program_id = :program_id;";
      con.createQuery(deleteJoin)
        .addParameter("program_id", id)
        .executeUpdate();
    }
  }

  public void update(String newName, String newDescription, String newUrl) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE programs SET name = :newName, description = :newDescription, url = :newUrl WHERE id = :id;";
      con.createQuery(sql)
        .addParameter("newName", newName)
        .addParameter("newDescription", newDescription)
        .addParameter("newUrl", newUrl)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public static List<Program> search(String searchQuery) {
    try(Connection con = DB.sql2o.open()) {
      String search = "SELECT * FROM programs WHERE lower(name) LIKE :searchQuery;";
      return con.createQuery(search)
        .addParameter("searchQuery", "%" + searchQuery.toLowerCase() + "%")
        .executeAndFetch(Program.class);
    }
  }

  public List<Language> getLanguages() {
    try(Connection con = DB.sql2o.open()) {
      String joinQuery = "SELECT languages.* FROM programs JOIN languages_programs ON (programs.id = languages_programs.program_id) JOIN languages ON (languages_programs.language_id = languages.id) WHERE programs.id = :id;";
      return con.createQuery(joinQuery)
        .addParameter("id" , this.id)
        .executeAndFetch(Language.class);
    }
  }

  public void addLanguage(Language newLanguage) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO languages_programs (language_id, program_id) VALUES (:language_id, :program_id);";
      con.createQuery(sql)
        .addParameter("program_id", this.id)
        .addParameter("language_id", newLanguage.getId())
        .executeUpdate();
    }
  }

  public void removeLanguage(int languageId) {
    try(Connection con = DB.sql2o.open()) {
      String removeQuery = "DELETE FROM languages_programs WHERE program_id=:program_id AND language_id=:language_id;";
      con.createQuery(removeQuery)
      .addParameter("program_id", this.id)
      .addParameter("language_id", languageId)
      .executeUpdate();
    }
  }

  public void removeAllLanguages() {
    try(Connection con = DB.sql2o.open()) {
      String deleteJoin = "DELETE FROM languages_programs WHERE program_id=:id;";
      con.createQuery(deleteJoin)
      .addParameter("id", id)
      .executeUpdate();
    }
  }
}
