import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Career {
  private String name;
  private int id;

  public Career(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public int getId() {
    return id;
  }

  public static List<Career> all() {
    String sql = "SELECT id, name FROM careers";
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
      return this.getName().equals(newCareer.getName()) &&
             this.getId() == newCareer.getId();
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO careers(name) VALUES (:name)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .executeUpdate()
        .getKey();
    }
  }

  public static Career fint(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM careers where id=:id";
      Career career = con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Career.class);
      return career;
    }
  }


}
