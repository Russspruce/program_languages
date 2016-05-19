import java.io.*;
import java.util.ArrayList;
import java.util.List;
import org.sql2o.*;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

public class WebScraper {

	public static WebDriver driver = new FirefoxDriver();

	public void openSite(String url) {
		driver.navigate().to(url);
  }

	/**
	 * grabs the status text and saves that into status.txt file
	 *
	 * @throws IOException
	 */
	public String getExampleText(String languageName) throws IOException {
    String result = "No code example (yet).";
    try {
      WebElement element = driver.findElement(By.xpath("//a[@name='" + languageName +"']/following-sibling::pre[1]"));
      result = element.getText();
    } catch (Exception e){
      System.out.println(languageName + " not found; skipped");
    }
    return result;
	}

  public void addToDatabase(String name, String example) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE languages SET example=:example WHERE name=:name";
      con.createQuery(sql)
        .addParameter("example", example)
        .addParameter("name", name)
        .executeUpdate();
    }
  }

	public void closeBrowser() {
		driver.close();
	}

	public static void main(String[] args) throws IOException {
    WebScraper webScraper = new WebScraper();
		webScraper.openSite("https://dl.dropboxusercontent.com/u/35009598/helloworld/index.htm");
    List<String> names;
    int counter = 0;
    try(Connection con = DB.sql2o.open()){
      String sql = "SELECT name FROM languages";
      names = con.createQuery(sql).executeAndFetch(String.class);
    }
    for (int i=0; i<names.size(); i++) {
      String exampleText = webScraper.getExampleText(names.get(i));
      if (!(exampleText.equals("No code example (yet)."))) {
        counter++;
      }
      webScraper.addToDatabase(names.get(i), exampleText);
      System.out.println(exampleText);
    }
		webScraper.closeBrowser();
    System.out.println(counter + " Code Examples Found");
	}
}
