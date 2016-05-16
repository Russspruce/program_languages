import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;


public class ProgramTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
   public void Program_initializesCorrectly_true() {
     Program testProgram = new Program("Name 1", "Description");
     assertTrue(testProgram instanceof Program);
   }
}
