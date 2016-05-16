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
}
