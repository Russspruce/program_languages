import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;
import java.util.Arrays;
import java.util.List;

public class LanguageTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();


  @Test
  public void Language_instantiatesCorrectly_true() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    assertEquals(true, testLanguage instanceof Language);
  }
  @Test
  public void getName_languageInstantiatesWithName_String() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    assertEquals("Java", testLanguage.getName());
  }

  @Test
  public void getDescription_languageInstantiatesWithDescription_String() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    assertEquals("Example text goes here for now", testLanguage.getDescription());
  }

  @Test
  public void all_emptyAtFirst_0() {
    assertEquals(0, Language.all().size());
  }
  @Test
  public void equals_returnsTrueIfNamesAretheSame_true() {
    Language firstLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    Language secondLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    assertTrue(firstLanguage.equals(secondLanguage));
  }

  @Test
  public void save_savesObjectIntoDatabase_true() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    testLanguage.save();
    assertTrue(Language.all().get(0).equals(testLanguage));
  }

  @Test
  public void save_assignsIdToObject_int() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    testLanguage.save();
    Language savedLanguage = Language.all().get(0);
    assertEquals(testLanguage.getId(), savedLanguage.getId());
  }

  @Test
  public void find_findLanguageInDatabase_true() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    testLanguage.save();
    Language savedLanguage = Language.find(testLanguage.getId());
    assertTrue(testLanguage.equals(savedLanguage));
  }

  @Test
  public void delete_deletesLanguage_true() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "release date", "http://java.com");
    testLanguage.save();
    int testLanguageId = testLanguage.getId();
    testLanguage.delete();
    assertEquals(null, Language.find(testLanguageId));
  }

  @Test
  public void addProgram_joinsLanguageAndProgram_true() {
    Language testLanguage = new Language("Name 1", "x", "y", "date", "release date",  "http://java.com");
    testLanguage.save();
    Program testProgram = new Program("Name 1", "Description", "http://www.google.com");
    testProgram.save();
    testLanguage.addProgram(testProgram);
    Program joinedProgram = testLanguage.getPrograms().get(0);
    assertTrue(testProgram.equals(joinedProgram));
    }

    @Test
    public void getPrograms_returnsAllAssociatedPrograms_int() {
      Language testLanguage = new Language("Name 1", "x", "y", "date", "release date",  "http://java.com");
      testLanguage.save();
      Program testProgram = new Program("Name 2", "Description", "http://www.google.com");
      testProgram.save();
      testLanguage.addProgram(testProgram);
      Program testProgram2 = new Program("Name 3", "Description", "http://www.google.com");
      testProgram2.save();
      testLanguage.addProgram(testProgram2);
      Program joinedProgram = testLanguage.getPrograms().get(0);
      assertTrue(testProgram.equals(joinedProgram));
      assertEquals(2, testLanguage.getPrograms().size());
    }

    @Test
    public void getTypes_returnsAllAssociatedTypes_int() {
      Language testLanguage = new Language("Name 1", "x", "y", "date", "release date",  "http://java.com");
      testLanguage.save();
      Type testType = new Type("Name 2", "Description");
      testType.save();
      testLanguage.addType(testType);
      Type testType2 = new Type("Name 3", "Description");
      testType2.save();
      testLanguage.addType(testType2);
      Type joinedType = testLanguage.getTypes().get(0);
      assertTrue(testType.equals(joinedType));
      assertEquals(2, testLanguage.getTypes().size());
    }

    @Test
    public void removeProgram_removesProgramAssociation_true() {
      Language testLanguage = new Language("Name 1", "x", "y", "date", "release date",  "http://java.com");
      testLanguage.save();
      Program testProgram = new Program("Name 2", "Description", "http://www.google.com");
      testProgram.save();
      testLanguage.addProgram(testProgram);
      testLanguage.removeProgram(testProgram.getId());
      assertEquals(0, testLanguage.getPrograms().size());
  }

  @Test
  public void search_findSetOfLanguagesByKeyword_list() {
    Language testLanguage = new Language("Name 1", "x", "y", "date", "release date",  "http://java.com");
    testLanguage.save();
    Language testLanguage2 = new Language("Name 2", "x", "y", "date", "release date",  "http://java.com");
    testLanguage2.save();
    Language testLanguage3 = new Language("Name 3vwX", "x", "y", "date", "release date",  "http://java.com");
    testLanguage3.save();
    Language testLanguage4 = new Language("Name 4Vwx", "x", "y", "date", "release date",  "http://java.com");
    testLanguage4.save();
    List<Language> testSearch = Language.search("vWx");
    assertTrue(testSearch.get(0).equals(testLanguage3));
    assertEquals(testSearch.size(), 2);
  }
}
