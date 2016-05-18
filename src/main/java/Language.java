import java.util.List;
import org.sql2o.*;
import java.util.Arrays;

public class Language {
  private int id;
  private String name;
  private String description;
  private String example;
  private String date;
  private String webpage;

  public Language(String name, String description, String example, String date, String webpage) {
    this.name = name;
    this.description = description;
    this.example = example;
    this.date = date;
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

  private String getWebpage() {
    return webpage;
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
      this.getWebpage().equals(newLanguage.getWebpage());
  }
}

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO languages(name, description, example, date, webpage) VALUES (:name, :description, :example, :date, :webpage)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("name", this.name)
      .addParameter("description", this.description)
      .addParameter("example", this.example)
      .addParameter("date", this.date)
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

  public static List<Language> search(String searchQuery) {
    try(Connection con = DB.sql2o.open()) {
      String search = "SELECT * FROM languagess WHERE lower(name) LIKE :searchQuery;";
      return con.createQuery(search)
        .addParameter("searchQuery", "%" + searchQuery.toLowerCase() + "%")
        .executeAndFetch(Language.class);
    }
  }

  public void update(String name, String description, String example, String date, String webpage) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE languages SET name = :name, description = :description, example = :example, date = :date, webpage = :webpage WHERE id = :id;";
      con.createQuery(sql)
        .addParameter("name", name)
        .addParameter("description", description)
        .addParameter("example", example)
        .addParameter("date", date)
        .addParameter("webpage", webpage)
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

      List<Band> careers = new ArrayList<Career>();

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



}
