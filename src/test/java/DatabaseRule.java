import org.junit.rules.ExternalResource;
import org.sql2o.*;

public class DatabaseRule extends ExternalResource {

  @Override
  protected void before() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/program_languages_test", null, null);
  }

  @
  Override
  protected void after() {
    try(Connection con = DB.sql2o.open()) {
      String deleteLanguagesQuery = "DELETE FROM languages *;";
      String deleteCareersQuery = "DELETE FROM careers *;";
      String deleteProgramsQuery = "DELETE FROM programs *;";
      con.createQuery(deleteLanguagesQuery).executeUpdate();
      con.createQuery(deleteCareersQuery).executeUpdate();
      con.createQuery(deleteProgramsQuery).executeUpdate();
    }
  }

}
