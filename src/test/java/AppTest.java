import static org.fluentlenium.core.filter.FilterConstructor.*;
import org.fluentlenium.adapter.FluentTest;
import org.junit.ClassRule;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import static org.assertj.core.api.Assertions.assertThat;
import static org.fluentlenium.core.filter.FilterConstructor.*;
import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;


public class AppTest extends FluentTest{

  public WebDriver webDriver = new HtmlUnitDriver();

  @Override
  public WebDriver getDefaultDriver() {
    return webDriver;
  }

  @ClassRule
  public static ServerRule server = new ServerRule();

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void rootTest() {
   goTo("http://localhost:4567/");
   assertThat(pageSource()).contains("Program Language");
  }

  @Test
  public void typeAddForm() {
    goTo("http://localHost:4567/type/add");
    fill("#name").with("Name 1");
    fill("#description").with("Description");
    submit("#submitType");
    assertThat(pageSource()).contains("Name 1");
  }

  @Test
  public void addTypeFormError() {
    goTo("http://localhost:4567/type/add");
    submit("#submitType");
    assertThat(pageSource()).contains("Please be sure");
  }

  @Test
  public void programAddForm() {
    goTo("http://localHost:4567/program/add");
    fill("#name").with("Name 1");
    fill("#description").with("Description");
    fill("#url").with("http://www.google.com");
    submit("#submitType");
    assertThat(pageSource()).contains("Name 1");
  }

  @Test
  public void addProgramFormError() {
    goTo("http://localhost:4567/program/add");
    submit("#submitProgram");
    assertThat(pageSource()).contains("Please be sure");
  }

  @Test
  public void associateLanguageWithType() {
    Type testType = new Type ("Name 1", "Description");
    testType.save();
    Language testLanguage = new Language("Name 2", "x", "y", "date", "http://java.com");
    testLanguage.save();
    Language testLanguage2 = new Language("Name 3", "x", "y", "date", "http://java.com");
    testLanguage2.save();
    goTo("http://localhost:4567/associate/types/" + testType.getId());
    click("#languages");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 3");
  }

  @Test
  public void associateLanguageWithProgram() {
    Program testProgram = new Program ("Name 1", "Description", "url");
    testProgram.save();
    Language testLanguage = new Language("Name 2", "x", "y", "date", "http://java.com");
    testLanguage.save();
    Language testLanguage2 = new Language("Name 3", "x", "y", "date", "http://java.com");
    testLanguage2.save();
    goTo("http://localhost:4567/associate/programs/" + testProgram.getId());
    click("#languages");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 3");
  }

  @Test
  public void associateLanguageWithCareer() {
    Career testCareer = new Career ("Name 1", "Description");
    testCareer.save();
    Language testLanguage = new Language("Name 2", "x", "y", "date", "http://java.com");
    testLanguage.save();
    Language testLanguage2 = new Language("Name 3", "x", "y", "date", "http://java.com");
    testLanguage2.save();
    goTo("http://localhost:4567/associate/careers/" + testCareer.getId());
    click("#languages");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 3");
  }

  @Test
  public void editType() {
    Type testType = new Type ("Name 1", "Description");
    testType.save();
    goTo("http://localhost:4567/type/" + testType.getId() + "/edit");
    fill("#name").with("Name 2");
    fill("#description").with("Description 2");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 2");
  }

  @Test
  public void editCareer() {
    Career testCareer = new Career ("Name 1", "Description");
    testCareer.save();
    goTo("http://localhost:4567/career/" + testCareer.getId() + "/edit");
    fill("#title").with("Title 2");
    fill("#description").with("Description 2");
    submit(".btn-success");
    assertThat(pageSource()).contains("Title 2");
  }

  @Test
  public void editProgram() {
    Program testProgram = new Program ("Name 1", "Description", "url");
    testProgram.save();
    goTo("http://localhost:4567/program/" + testProgram.getId() + "/edit");
    fill("#name").with("Name 2");
    fill("#description").with("Description 2");
    fill("#url").with("url2");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 2");
  }

  @Test
  public void deleteProgram() {
    Program testProgram = new Program ("Name 1", "Description", "url");
    testProgram.save();
    goTo("http://localhost:4567/program/" + testProgram.getId() + "/edit");
    click(".btn-danger");
    assertThat(pageSource()).doesNotContain("Name 1");
  }

  @Test
  public void deleteType() {
    Type testType = new Type ("Name 1", "Description");
    testType.save();
    goTo("http://localhost:4567/type/" + testType.getId() + "/edit");
    click(".btn-danger");
    assertThat(pageSource()).doesNotContain("Name 1");
  }

  @Test
  public void deleteCareer() {
    Career testCareer = new Career ("Title 1", "Description");
    testCareer.save();
    goTo("http://localhost:4567/career/" + testCareer.getId() + "/edit");
    click(".btn-danger");
    assertThat(pageSource()).doesNotContain("Title 1");
  }

  @Test
  public void deleteLanguage() {
    Language testLanguage = new Language ("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "http://java.com");
    testLanguage.save();
    goTo("http://localhost:4567/language/" + testLanguage.getId() + "/edit");
    click(".btn-danger");
    assertThat(pageSource()).doesNotContain("Java");
  }

  @Test
  public void careerAddPageLoads() {
    goTo("http://localhost:4567/career/add");
    assertThat(pageSource()).contains("Add");
  }

  @Test
  public void careerAddPageSavesInput() {
    goTo("http://localhost:4567/career/add");
    fill("#title").with("title 1");
    submit(".btn-success");
    assertThat(pageSource()).contains("title 1");
  }

  @Test
  public void careersPageLoadsAndShowsCareers() {
    goTo("http://localhost:4567/careers");
    assertThat(pageSource()).contains("All Careers");
  }

  @Test
  public void allLanguagesPageIsDisplayed() {
    goTo("http://localhost:4567/");
    click("a", withText("Add Language"));
    assertThat(pageSource().contains("Add Language"));
  }

  @Test
  public void individualLanguagePageIsDisplayed() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "http://java.com");
    testLanguage.save();
    String url = String.format("http://localhost:4567/language/%d", testLanguage.getId());
    goTo(url);
    assertThat(pageSource()).contains("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "http://java.com");
  }

  @Test
  public void editLanguage() {
    Language testLanguage = new Language("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "http://java.com");
    testLanguage.save();
    goTo("http://localhost:4567/language/" + testLanguage.getId() + "/edit");
    fill("#name").with("Name 2");
    fill("#description").with("Description 2");
    fill("#webpage").with("url2");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 2");
  }

  @Test
  public void associateCareerWithLanguage() {
    Career testCareer = new Career ("Name 1", "Description");
    testCareer.save();
    Career testCareer2 = new Career ("Name 2", "Description 2");
    testCareer2.save();
    Language testLanguage = new Language("Name 3", "x", "y", "date", "http://java.com");
    testLanguage.save();
    goTo("http://localhost:4567/associate/language/careers/" + testLanguage.getId());
    click("#careers");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 2");
  }

  @Test
  public void associateTypeWithLanguage() {
    Type testType = new Type ("Name 1", "Description");
    testType.save();
    Type testType2 = new Type ("Name 2", "Description 2");
    testType2.save();
    Language testLanguage = new Language("Name 3", "x", "y", "date", "http://java.com");
    testLanguage.save();
    goTo("http://localhost:4567/associate/language/types/" + testLanguage.getId());
    click("#types");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 2");
  }

  @Test
  public void associateProgramWithLanguage() {
    Program testProgram = new Program ("Name 1", "Description", "url");
    testProgram.save();
    Program testProgram2 = new Program ("Name 2", "Description 2", "url 2");
    testProgram2.save();
    Language testLanguage = new Language("Name 3", "x", "y", "date", "http://java.com");
    testLanguage.save();
    goTo("http://localhost:4567/associate/language/programs/" + testLanguage.getId());
    click("#programs");
    submit(".btn-success");
    assertThat(pageSource()).contains("Name 2");
  }

  @Test public void search() {
    Language testLanguage = new Language("Name 3", "x", "y", "date", "http://java.com");
    testLanguage.save();
    Program testProgram = new Program ("Name 2", "Description", "url");
    testProgram.save();
    Type testType = new Type ("Name 1", "Description");
    testType.save();
    Career testCareer = new Career ("Name 1", "Description");
    testCareer.save();
    goTo("http://localhost:4567/");
    fill("#search").with("e 1");
    submit(".btn-info");
    assertThat(pageSource()).doesNotContain("Name 2");
    assertThat(pageSource()).contains("Name 1");
  }

  @Test
  public void careerDuplicateErrorCatchesAndDisplays() {
    Career testCareer = new Career ("Name 1", "Description");
    testCareer.save();
    goTo("http://localhost:4567/career/add");
    fill("#title").with("Name 1");
    submit(".btn-success");
    assertThat(pageSource()).contains("Career already listed");
  }

  @Test
  public void languageDuplicateErrorCatchesAndDisplays() {
    Language testLanguage = new Language ("Language1", "Description", "example", "date", "webpage");
    testLanguage.save();
    goTo("http://localhost:4567/language/add");
    fill("#name").with("Name 1");
    submit(".btn-success");
    assertThat(pageSource()).contains("Language already listed");
  }

  // @Test
  // public void programDuplicateErrorCatchesAndDisplays() {
  //   Career testProgram = new Program ("Name 1", "Description");
  //   testProgram.save();
  //   goTo("http://localhost:4567/program/add");
  //   fill("#name").with("Name 1");
  //   submit(".btn-success");
  //   assertThat(pageSource()).contains("Program already listed");
  // }
  //
  // @Test
  // public void typeDuplicateErrorCatchesAndDisplays() {
  //   Career testType = new Type ("Name 1", "Description");
  //   testType.save();
  //   goTo("http://localhost:4567/type/add");
  //   fill("#name").with("Name 1");
  //   submit(".btn-success");
  //   assertThat(pageSource()).contains("Type already listed");
  // }
}
