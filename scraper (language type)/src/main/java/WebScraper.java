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
	public List<String> getExampleText(String languageName) throws IOException {
		List<String> results = new ArrayList<String>();
    try {
      List<WebElement> element = driver.findElements(By.xpath("//a[text()='" + languageName + "']/preceding::h2[1]"));
			System.out.println(languageName + ": Found " + element.size() + " matches.");
			for (int i=0; i<element.size(); i++) {
				String result = element.get(i).getText();
				result = result.substring(0, result.length() - 6);
				results.add(result);
			}
    } catch (Exception e){
      System.out.println(languageName + " not found; skipped");
    }
    return results;
	}

  public void addToDatabase(String name, String type) {
		Integer typeId;
		Integer languageId;
		try(Connection con = DB.sql2o.open()) {
			String sql = "SELECT id FROM types WHERE name=:name";
			typeId = con.createQuery(sql)
				.addParameter("name", type)
				.executeAndFetchFirst(Integer.class);
		}
		try(Connection con = DB.sql2o.open()) {
			String sql = "SELECT id FROM languages WHERE name=:name";
			languageId = con.createQuery(sql)
				.addParameter("name", name)
				.executeAndFetchFirst(Integer.class);
		}
		if (typeId != null) {
			System.out.println(type + " found in database. Not creating new entry.");
			try(Connection con = DB.sql2o.open()) {
				String sql = "INSERT INTO languages_types (language_id, type_id) VALUES (:language_id, :type_id)";
				con.createQuery(sql)
					.addParameter("language_id", languageId)
					.addParameter("type_id", typeId)
					.executeUpdate();
			}
		} else {
			System.out.println(type + " not found in database. Createing new entry.");
			try(Connection con = DB.sql2o.open()) {
				String sql = "INSERT INTO types (name) VALUES (:name) RETURNING id";
				typeId = con.createQuery(sql)
					.addParameter("name", type)
					.executeAndFetchFirst(Integer.class);
			}
			try(Connection con = DB.sql2o.open()) {
				String sql = "INSERT INTO languages_types (language_id, type_id) VALUES (:language_id, :type_id)";
				con.createQuery(sql)
					.addParameter("language_id", languageId)
					.addParameter("type_id", typeId)
					.executeUpdate();
			}

		}
  }

	public void closeBrowser() {
		driver.close();
	}

	public static void main(String[] args) throws IOException {
    WebScraper webScraper = new WebScraper();
		webScraper.openSite("https://en.wikipedia.org/wiki/List_of_programming_languages_by_type");
    List<String> names;
    try(Connection con = DB.sql2o.open()){
      String sql = "SELECT name FROM languages";
      names = con.createQuery(sql).executeAndFetch(String.class);
    }
    for (int i=0; i<names.size(); i++) {
      List<String> exampleText = webScraper.getExampleText(names.get(i));
			for (int j=0; j<exampleText.size(); j++) {
				webScraper.addToDatabase(names.get(i), exampleText.get(j));
			}
    }
		webScraper.closeBrowser();
	}

}
