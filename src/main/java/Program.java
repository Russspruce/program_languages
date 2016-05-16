import java.util.ArrayList;
import java.util.List;
import org.sql2o.*;

public class Program {
  private String name;
  private String description;
  private int id;

  public Program (String name, String description) {
    this.name = name;
    this.description = description;
  }

  public String getName() {
    return name;
  }

  public String getDescription() {
    return description;
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
        newProgram.getId() == this.id;
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO programs (name, description) VALUES (:name, :description);";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .addParameter("description", this.description)
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

  public void update(String newName, String newDescription) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE programs SET name = :newName, description = :newDescription WHERE id = :id;";
      con.createQuery(sql)
        .addParameter("newName", newName)
        .addParameter("newDescription", newDescription)
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
}
