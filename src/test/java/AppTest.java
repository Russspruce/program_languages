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
    assertThat(pageSource()).contains("Program Language Database");
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
    String url = String.format("http://localhost:4567/languages/%d", testLanguage.getId());
    goTo(url);
    assertThat(pageSource()).contains("Java", "Example text goes here for now", "More example text for now.", "May 23rd, 1995", "http://java.com");
  }

  
}
