import java.util.ArrayList;
import java.util.List;
import org.sql2o.*;

public class Type {
  private String name;
  private String description;
  private int id;

  public Type (String name, String description) {
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

  public static List<Type> all() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM types;";
      return con.createQuery(sql)
        .executeAndFetch(Type.class);
    }
  }

  @Override
  public boolean equals(Object otherType) {
    if(!(otherType instanceof Type)) {
      return false;
    } else {
      Type newType = (Type) otherType;
      return newType.getName().equals(this.name) &&
        newType.getDescription().equals(this.description) &&
        newType.getId() == this.id;
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO types (name, description) VALUES (:name, :description);";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .addParameter("description", this.description)
        .executeUpdate()
        .getKey();
    }
  }

  public static Type find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM types WHERE id = :id;";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Type.class);
    }
  }

  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String deleteType = "DELETE FROM types WHERE id = :id;";
      con.createQuery(deleteType)
        .addParameter("id", id)
        .executeUpdate();

      String deleteJoin = "DELETE FROM languages_types WHERE type_id = :type_id;";
      con.createQuery(deleteJoin)
        .addParameter("type_id", id)
        .executeUpdate();
    }
  }

  public void update(String newName, String newDescription) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE types SET name = :newName, description = :newDescription WHERE id = :id;";
      con.createQuery(sql)
        .addParameter("newName", newName)
        .addParameter("newDescription", newDescription)
        .addParameter("id", id)
        .executeUpdate();
    }
  }
  public static List<Type> search(String searchQuery) {
    try(Connection con = DB.sql2o.open()) {
      String search = "SELECT * FROM types WHERE lower(name) LIKE :searchQuery;";
      return con.createQuery(search)
        .addParameter("searchQuery", "%" + searchQuery.toLowerCase() + "%")
        .executeAndFetch(Type.class);
    }
  }
}
