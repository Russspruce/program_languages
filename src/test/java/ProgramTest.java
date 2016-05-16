import java.util.List;
import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;


public class ProgramTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
   public void Program_initializesCorrectly_true() {
     Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
     assertTrue(testProgram instanceof Program);
   }

   @Test public void getName_returnsName_String() {
    Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
    assertEquals("Name 1", testProgram.getName());
  }

  @Test
  public void all_initializeAsEmpty_0() {
    assertEquals(0, Program.all().size());
  }

  @Test
  public void equals_returnsTrueIfBothInstancesSame_true() {
    Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
    Program testProgram2 = new Program("Name 1", "Description", "http://www.google.com");
    assertTrue(testProgram.equals(testProgram2));
  }

  @Test
  public void save_assignsIdToInstance_int() {
    Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
    testProgram.save();
    Program savedProgram = Program.all().get(0);
  }

  @Test
  public void find_findsInstanceById_Program() {
    Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
    testProgram.save();
    Program foundProgram = Program.find(testProgram.getId());
    assertTrue(foundProgram.equals(testProgram));
  }

  @Test
  public void delete_deletesInstanceFromTable() {
    Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
    testProgram.save();
    testProgram.delete();
    assertEquals(0, Program.all().size());
  }

  @Test
  public void update_updatesNameAndDescription() {
    Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
    testProgram.save();
    testProgram.update("Name 2", "Description 2", "http://www.google.com");
    assertEquals("Name 2", Program.find(testProgram.getId()).getName());
    assertEquals("Description 2", Program.find(testProgram.getId()).getDescription());
  }

  @Test
  public void search_findSetOfProgramsByKeyword_list() {
    Program testProgram = new Program("abcde", "Description", "http://www.google.com");
    testProgram.save();
    Program testProgram2 = new Program("cdefg", "Description", "http://www.google.com");
    testProgram2.save();
    Program testProgram3 = new Program("vwxyz", "Description", "http://www.google.com");
    testProgram3.save();
    Program testProgram4 = new Program("rstuvwx", "Description", "http://www.google.com");
    testProgram4.save();
    List<Program> testSearch = Program.search("vWx");
    assertTrue(testSearch.get(0).equals(testProgram3));
    assertEquals(testSearch.size(), 2);
  }
}