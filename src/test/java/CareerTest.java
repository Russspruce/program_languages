import org.sql2o.*;
import org.junit.*;
import java.util.List;
import static org.junit.Assert.*;

public class CareerTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void Career_instantiatesCorrectly_True() {
    Career myCareer = new Career("CareerTitle", "Description");
    assertEquals(true, myCareer instanceof Career);
  }

  @Test
  public void getTitle_careerInstantiatesWithTitle_String() {
    Career myCareer = new Career("CareerTitle", "Description");
    assertEquals("CareerTitle", myCareer.getTitle());
  }

  @Test
  public void all_emptyAtFirst_0() {
    assertEquals(0, Career.all().size());
  }

  @Test
  public void equals_returnsTrueIfTitlesAretheSame_true() {
    Career firstCareer = new Career("CareerTitle", "Description");
    Career secondCareer = new Career("CareerTitle", "Description");
    assertTrue(firstCareer.equals(secondCareer));
  }

  @Test
  public void save_savesObjectIntoDatabase_true() {
    Career myCareer = new Career("CareerTitle", "Description");
    myCareer.save();
    assertTrue(Career.all().get(0).equals(myCareer));
  }

  @Test
  public void save_assignsIdToObject_int() {
    Career myCareer = new Career("CareerTitle", "Description");
    myCareer.save();
    Career savedCareer = Career.all().get(0);
    assertEquals(myCareer.getId(), savedCareer.getId());
  }

  @Test
  public void find_findsCareerInDatabase_true() {
    Career myCareer = new Career("CareerTitle", "Description");
    myCareer.save();
    Career savedCareer = Career.find(myCareer.getId());
    assertTrue(myCareer.equals(savedCareer));
  }

  @Test
  public void update_updatesCareerTitle_true() {
    Career myCareer = new Career("Career1", "Description");
    myCareer.save();
    myCareer.update("Career2", "Description2");
    assertEquals("Career2", Career.find(myCareer.getId()).getTitle());
  }

  @Test
  public void delete_deletesCareer_true() {
    Career myCareer = new Career("Career1", "Description");
    myCareer.save();
    int myCareerId = myCareer.getId();
    myCareer.delete();
    assertEquals(null, Career.find(myCareerId));
  }
}
