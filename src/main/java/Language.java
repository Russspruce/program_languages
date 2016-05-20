import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;
import java.util.Arrays;

public class Language {
  private int id;
  private String name;
  private String description;
  private String example;
  private String date;
  private String most_recent_release_date;
  private String webpage;

  public Language(String name, String description, String example, String date, String most_recent_release_date, String webpage) {
    this.name = name;
    this.description = description;
    this.example = example;
    this.date = date;
    this.most_recent_release_date = most_recent_release_date;
    this.webpage = webpage;
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

  public String getRelease() {
    return most_recent_release_date;
  }

  public String getWebpage() {
    return webpage;
  }

  public static List<Language> all() {
    String sql = "SELECT * FROM languages";
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

      return this.getId() == newLanguage.getId()  && this.getName().equals(newLanguage.getName());
  }
}

  public void save() {
    try(Connection con = DB.sql2o.open()) {

      String sql = "INSERT INTO languages(name, description, example, date, most_recent_release_date, webpage) VALUES (:name, :description, :example, :date, :release, :webpage)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("name", this.name)
      .addParameter("description", this.description)
      .addParameter("example", this.example)
      .addParameter("date", this.date)
      .addParameter("release", this.most_recent_release_date)
      .addParameter("webpage", this.webpage)
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

      String joinDeleteQuery = "DELETE FROM languages_careers WHERE language_id = :language_id";
      con.createQuery(joinDeleteQuery)
      .addParameter("language_id", this.getId())
      .executeUpdate();

      String joinDeleteQuery2 = "DELETE FROM languages_programs WHERE language_id = :language_id";
      con.createQuery(joinDeleteQuery2)
      .addParameter("language_id", this.getId())
      .executeUpdate();

      String joinDeleteQuery3 = "DELETE FROM languages_types WHERE language_id = :language_id";
      con.createQuery(joinDeleteQuery3)
      .addParameter("language_id", this.getId())
      .executeUpdate();
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
      String sql = "INSERT INTO languages_types (language_id, type_id) VALUES (:language_id, :type_id);";
      con.createQuery(sql)
        .addParameter("language_id", this.id)
        .addParameter("type_id", newType.getId())
        .executeUpdate();
    }
  }

  public static List<Language> search(String searchQuery) {
    try(Connection con = DB.sql2o.open()) {
      String search = "SELECT * FROM languages WHERE lower(name) LIKE :searchQuery;";
      return con.createQuery(search)
        .addParameter("searchQuery", "%" + searchQuery.toLowerCase() + "%")
        .executeAndFetch(Language.class);
    }
  }

  public void update(String name, String description, String example, String date, String most_recent_release_date, String webpage) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE languages SET name = :name, description = :description, example = :example, date = :date, most_recent_release_date = :release, webpage = :webpage WHERE id = :id;";
      con.createQuery(sql)
        .addParameter("name", name)
        .addParameter("description", description)
        .addParameter("example", example)
        .addParameter("date", date)
        .addParameter("release", most_recent_release_date)
        .addParameter("webpage", webpage)
        .addParameter("id", id)
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

  public List<Type> getTypes() {
    try(Connection con = DB.sql2o.open()) {
      String joinQuery = "SELECT types.* FROM languages JOIN languages_types ON (languages.id = languages_types.language_id) JOIN types ON (languages_types.type_id = types.id) WHERE languages.id = :id;";
      return con.createQuery(joinQuery)
        .addParameter("id" , this.id)
        .executeAndFetch(Type.class);
    }
  }

  public void removeProgram(int programId) {
    try(Connection con = DB.sql2o.open()) {
      String removeQuery = "DELETE FROM languages_programs WHERE program_id=:program_id AND language_id=:language_id;";
      con.createQuery(removeQuery)
        .addParameter("program_id", programId)
        .addParameter("language_id", this.id)
        .executeUpdate();
    }
  }

  public void removeAllPrograms() {
    try(Connection con = DB.sql2o.open()) {
      String deleteJoin = "DELETE FROM languages_programs WHERE language_id=:id;";
      con.createQuery(deleteJoin)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public void removeType(int typeId) {
    try(Connection con = DB.sql2o.open()) {
      String removeQuery = "DELETE FROM languages_types WHERE type_id=:type_id AND language_id=:language_id;";
      con.createQuery(removeQuery)
        .addParameter("type_id", typeId)
        .addParameter("language_id", this.id)
        .executeUpdate();
    }
  }

  public void removeAllTypes() {
    try(Connection con = DB.sql2o.open()) {
      String deleteJoin = "DELETE FROM languages_types WHERE language_id=:id;";
      con.createQuery(deleteJoin)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public void removeAllCareers() {
    try(Connection con = DB.sql2o.open()) {
      String deleteJoin = "DELETE FROM languages_careers WHERE language_id=:id;";
      con.createQuery(deleteJoin)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public void addCareer(Career career) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO languages_careers (language_id, career_id) VALUES (:language_id, :career_id)";
      con.createQuery(sql)
      .addParameter("career_id", career.getId())
      .addParameter("language_id", this.getId())
      .executeUpdate();
    }
  }

  public List<Career> getCareers() {
    try(Connection con = DB.sql2o.open()){
      String joinQuery = "SELECT career_id FROM languages_careers WHERE language_id = :language_id";
      List<Integer> career_ids = con.createQuery(joinQuery)
      .addParameter("language_id", this.getId())
      .executeAndFetch(Integer.class);

      List<Career> careers = new ArrayList<Career>();

      for (Integer career_id : career_ids) {
        String venueQuery = "SELECT * FROM careers WHERE id = :career_id";
        Career career = con.createQuery(venueQuery)
        .addParameter("career_id", career_id)
        .executeAndFetchFirst(Career.class);
        careers.add(career);
      }
      return careers;
    }
  }


  public static List<Language> sortByAlpha() {
    try(Connection con = DB.sql2o.open()) {
      String sort = "SELECT * FROM languages ORDER BY lower(name) ASC;";
      return con.createQuery(sort)
        .executeAndFetch(Language.class);
    }
  }

  public static boolean checkDuplicates(String name) {
    try(Connection con = DB.sql2o.open()) {
      String nameQuery = "SELECT name FROM languages;";
      List<String> names = (con.createQuery(nameQuery)
        .executeAndFetch(String.class));
      if (names.contains(name)) {
        return true;
      } else {
        return false;
      }
    }
  }
}
