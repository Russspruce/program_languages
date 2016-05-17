import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Career {
  private String title;
  private String description;
  private int id;

  public Career(String title, String description) {
    this.title = title;
    this.description = description;
  }

  public String getTitle() {
    return title;
  }

  public String getDescription() {
    return description;
  }

  public int getId() {
    return id;
  }

  public static List<Career> all() {
    String sql = "SELECT id, title, description FROM careers";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(Career.class);
    }
  }

  @Override
  public boolean equals(Object otherCareer){
    if (!(otherCareer instanceof Career)) {
      return false;
    } else {
      Career newCareer = (Career) otherCareer;
      return this.getTitle().equals(newCareer.getTitle()) &&
             this.getDescription().equals(newCareer.getDescription()) &&
             this.getId() == newCareer.getId();
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO careers(title, description) VALUES (:title, :description)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("title", this.title)
        .addParameter("description", this.description)
        .executeUpdate()
        .getKey();
    }
  }

  public static Career find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM careers where id=:id";
      Career career = con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Career.class);
      return career;
    }
  }

  public void update(String newTitle, String newDescription) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE careers SET title = :title, description = :description WHERE id = :id";
      con.createQuery(sql)
        .addParameter("title", newTitle)
        .addParameter("description", newDescription)
        .addParameter("id", this.id)
        .executeUpdate();
    }
  }

  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String deleteQuery = "DELETE FROM careers WHERE id = :id;";
        con.createQuery(deleteQuery)
          .addParameter("id", this.getId())
          .executeUpdate();
    }
  }

  public static List<Career> search(String searchQuery) {
  try(Connection con = DB.sql2o.open()) {
    String search = "SELECT * FROM careers WHERE lower(title) LIKE :searchQuery;";
    return con.createQuery(search)
      .addParameter("searchQuery", "%" + searchQuery.toLowerCase() + "%")
      .executeAndFetch(Career.class);
    }
  }
}
