import java.util.List;
import org.sql2o.*;
import java.util.Arrays;

public class Language {
  private int id;
  private String name;
  private String description;
  private String example;
  private String date;

  public Language(String name, String description, String example, String date) {
    this.name = name;
    this.description = description;
    this.example = example;
    this.date = date;
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

  public static List<Language> all() {
    String sql = "SELECT id, name, description, example, date FROM languages";
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
      this.getDate().equals(newLanguage.getDate());
  }


  }
}
