import java.util.Map;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/career/add", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("career", request.session().attribute("career"));
      model.put("template", "templates/career-add.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/career/add", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String title = request.queryParams("title");
      String description = request.queryParams("description");
      Career newCareer = new Career(title, description);
      newCareer.save();
      model.put("career", newCareer);
      model.put("Template", "templates/career");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/careers", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("careers", Career.all());
      model.put("template", "templates/careers.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/career/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int careerId = Integer.parseInt(request.params(":id"));
      Career career = Career.find(careerId);
      model.put("career", career);
      model.put("template", "templates/career.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());
  }
}
