import org.sql2o.*;
import org.junit.*;
import java.util.List;
import static org.junit.Assert.*;

public class CareerTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void Career_instantiatesCorrectly_True() {
    Career myCareer = new Career("CareerName");
    assertEquals(true, myCareer instanceof Career);
  }

  @Test
  public void getName_careerInstantiatesWithName_String() {
    Career myCareer = new Career("CareerName");
    assertEquals("CareerName", myCareer.getName());
  }

  @Test
  public void all_emptyAtFirst_0() {
    assertEquals(0, Career.all().size());
  }

  @Test
  public void equals_returnsTrueIfNamesAretheSame_true() {
    Career firstCareer = new Career("CareerName");
    Career secondCareer = new Career("CareerName");
    assertTrue(firstCareer.equals(secondCareer));
  }







}
