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

  // @Test
  // public void rootTest() {
  //  goTo("http://localhost:4567/");
  //  assertThat(pageSource()).contains("");
  // }

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
    submit(".btn");
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
    submit(".btn");
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

}
