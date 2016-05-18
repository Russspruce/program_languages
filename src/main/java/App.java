import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/languages/new", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/language-form.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/languages", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      model.put("languages", Language.all());
      model.put("template", "templates/languages.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/languages", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      String description = request.queryParams("description");
      String example = request.queryParams("example");
      String date = request.queryParams("date");
      String webpage = request.queryParams("webpage");
      Language newLanguage = new Language(name, description, example, date, webpage);
      newLanguage.save(); //*** ADDED FOR DB VERSION ***
      model.put("template", "templates/languages.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("languages/:id/edit", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Language language = Language.find(Integer.parseInt(request.params("id")));
      model.put("language", language);
      model.put("allLanguages", Language.all());
      model.put("template", "templates/language-edit.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/languages/:id/edit", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Language language = Language.find(Integer.parseInt(request.params("id")));
      String name = request.queryParams("name");
      String description = request.queryParams("description");
      String example = request.queryParams("example");
      String date = request.queryParams("date");
      String webpage = request.queryParams("webpage");
      language.update(name, description, example, date, webpage);
      String url = String.format("/languages/%d", language.getId());
      response.redirect(url);
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/add_careers", (request, response) -> {
      int careerId = Integer.parseInt(request.queryParams("career_id"));
      int languageId = Integer. parseInt(request.queryParams("language_id"));
      Language language = Language.find(languageId);
      Career career = Career.find(careerId);
      venue.addCareer(career);
      response.redirect("/languages/" + languageId);
      return null;

  }
}
