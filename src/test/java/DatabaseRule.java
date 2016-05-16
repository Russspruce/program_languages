import org.junit.rules.ExternalResource;
import org.sql2o.*;

public class DatabaseRule extends ExternalResource {

  // @Override
  // protected void before() {
  //   DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/program_languages_test", null, null);
  // }
  //
  // @Override
  // protected void after() {
  //   try(Connection con = DB.sql2o.open()) {
  //     String deleteCuisinesQuery = "DELETE FROM cuisines *;";
  //     String deleteRestaurantsQuery = "DELETE FROM restaurants *;";
  //     String deleteReviewsQuery = "DELETE FROM reviews *;";
  //     con.createQuery(deleteCuisinesQuery).executeUpdate();
  //     con.createQuery(deleteRestaurantsQuery).executeUpdate();
  //     con.createQuery(deleteReviewsQuery).executeUpdate();
  //
  //   }
  // }

}
