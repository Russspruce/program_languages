import org.junit.rules.ExternalResource;
import spark.Spark;

public class ServerRule extends ExternalResource {

  protected void before() {
    String[] args = {};
    App.main(args); //Replace with main class
   }

  protected void after() {
    Spark.stop();
  }
}
