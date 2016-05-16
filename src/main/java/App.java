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

    get("/type/add", (request, response) -> {
    Map<String, Object> model = new HashMap<String, Object>();
    model.put("description", "");
    model.put("template", "templates/type-add.vtl");
    return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/type/add", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name").trim();
      String description = request.queryParams("description");

      if(name.equals("")) {
        model.put("formError", true);
        model.put("description", description);
        model.put("template", "templates/type-add.vtl");
      } else {
        Type newType = new Type(name, description);
        newType.save();

        model.put("type", newType);
        model.put("new", true);
        model.put("template", "templates/type.vtl");
      }

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/program/add", (request, response) -> {
    Map<String, Object> model = new HashMap<String, Object>();
    model.put("description", "");
    model.put("url", "");
    model.put("template", "templates/program-add.vtl");
    return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/program/add", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name").trim();
      String description = request.queryParams("description");
      String url = request.queryParams("url");

      if(name.equals("")) {
        model.put("formError", true);
        model.put("description", description);
        model.put("url", url);
        model.put("template", "templates/program-add.vtl");
      } else {
        Program newProgram = new Program(name, description, url);
        newProgram.save();

        model.put("program", newProgram);
        model.put("new", true);
        model.put("template", "templates/program.vtl");
      }

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());
  }
}
