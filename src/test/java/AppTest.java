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
  public void careerAddPageLoads() {
    goTo("career/add");
    assertThat(pageSource()).contains("Add");
  }

  @Test
  public void careerAddPageSavesInput() {
    goTo("career/add");
    fill("title").with("description");
    submit(".btn");
    assertThat(pageSource()).contains("");
  }

  @Test
  public void careersPageLoadsAndShowsCareers() {
    goTo("/careers");
    assertThat(pageSource()).contains()
  }

  @Test
  public void career
}
