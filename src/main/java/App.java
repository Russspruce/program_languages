import java.util.Map;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("careers", Career.all());
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/career-form", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("career", request.session().attribute("career"));
      model.put("template", "templates/career-form.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/", (request, response) -> {
      String title = request.queryParams("title");
      String description = request.queryParams("description");
      Career newCareer = new Career(title,description);
      newCareer.save();
      response.redirect("/");
      return null;
    });

  }
}
