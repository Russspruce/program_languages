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
      model.put("languages", Stylist.all());
      model.put("template", "templates/languages.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/languages", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      String description = request.queryParams("description");
      String example = request.queryParams("example");
      String date = request.queryParams("date");
      String url = request.queryParams("url");
      Stylist newStylist = new Stylist(styler);
      newStylist.save(); //*** ADDED FOR DB VERSION ***
      model.put("template", "templates/success.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

  }
}
