import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Career {
  private String name;
  private int id;

  public Career(String name) {
    this.name = name;
  }

  // public String getName() {
  //   return name;
  // }

  // public static List<Career> all() {
  //   String sql = "SELECT id, name FROM careers";
  //   try(Connection con = DB.sql2o.open()) {
  //     return con.createQuery(sql).executeAndFetch(Career.class);
  //   }
  // }



}
