import java.util.List;
import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;


public class TypeTest {

  // @Rule
  // public DatabaseRule database = new DatabaseRule();
  //
  // @Test
  //  public void Type_initializesCorrectly_true() {
  //    Type testType = new Type("Name 1", "Description");
  //    assertTrue(testType instanceof Type);
  //  }
  //
  //  @Test public void getName_returnsName_String() {
  //   Type testType = new Type("Name 1", "Description");
  //   assertEquals("Name 1", testType.getName());
  // }
  //
  // @Test
  // public void all_initializeAsEmpty_0() {
  //   assertEquals(0, Type.all().size());
  // }
  //
  // @Test
  // public void equals_returnsTrueIfBothInstancesSame_true() {
  //   Type testType = new Type("Name 1", "Description");
  //   Type testType2 = new Type("Name 1", "Description");
  //   assertTrue(testType.equals(testType2));
  // }
  //
  // @Test
  // public void save_assignsIdToInstance_int() {
  //   Type testType = new Type("Name 1", "Description");
  //   testType.save();
  //   Type savedType = Type.all().get(0);
  // }
  //
  // @Test
  // public void find_findsInstanceById_Type() {
  //   Type testType = new Type("Name 1", "Description");
  //   testType.save();
  //   Type foundType = Type.find(testType.getId());
  //   assertTrue(foundType.equals(testType));
  // }
  //
  // @Test
  // public void delete_deletesInstanceFromTable() {
  //   Type testType = new Type("Name 1", "Description");
  //   testType.save();
  //   testType.delete();
  //   assertEquals(0, Type.all().size());
  // }
  //
  // @Test
  // public void update_updatesNameAndDescription() {
  //   Type testType = new Type("Name 1", "Description");
  //   testType.save();
  //   testType.update("Name 2", "Description 2");
  //   assertEquals("Name 2", Type.find(testType.getId()).getName());
  //   assertEquals("Description 2", Type.find(testType.getId()).getDescription());
  // }
  //
  // @Test
  // public void search_findSetOfTypesByKeyword_list() {
  //   Type testType = new Type("abcde", "Description");
  //   testType.save();
  //   Type testType2 = new Type("cdefg", "Description");
  //   testType2.save();
  //   Type testType3 = new Type("vwxyz", "Description");
  //   testType3.save();
  //   Type testType4 = new Type("rstuvwx", "Description");
  //   testType4.save();
  //   List<Type> testSearch = Type.search("vWx");
  //   assertTrue(testSearch.get(0).equals(testType3));
  //   assertEquals(testSearch.size(), 2);
  // }
}
