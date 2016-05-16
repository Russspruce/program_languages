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
        model.put("languages", newType.getLanguages());
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
        model.put("languages", newProgram.getLanguages());
        model.put("new", true);
        model.put("template", "templates/program.vtl");
      }

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/type/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int typeId = Integer.parseInt(request.params(":id"));
      Type type = Type.find(typeId);
      model.put("type", type);
      model.put("languages", type.getLanguages());
      model.put("template", "templates/type.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/associate/types/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Type type = Type.find(Integer.parseInt(request.params(":id")));

      model.put("type", type);
      model.put("languages", Language.all());
      model.put("template", "templates/associate-types.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/associate/types/:id", (request, response) -> {
      int typeId = Integer.parseInt(request.params(":id"));
      Type type = Type.find(typeId);

      type.removeAllLanguages();
      String[] languageIds = request.queryParamsValues("languages");
      if (languageIds != null){
        for (String languageId : languageIds) {
          type.addLanguage(Language.find(Integer.parseInt(languageId)));
        }
      }
      response.redirect("/type/" + typeId);
      return null;
    });

    get("/type/list", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("types", Type.all());
      model.put("template", "templates/types.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/program/list", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("programs", Program.all());
      model.put("template", "templates/programs.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/type/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int typeId = Integer.parseInt(request.params(":id"));
      Type type = Type.find(typeId);
      model.put("type", type);
      model.put("description", type.getDescription());
      model.put("template", "templates/edit-type.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/type/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int typeId = Integer.parseInt(request.params(":id"));
      Type type = Type.find(typeId);
      String name = request.queryParams("name").trim();
      String description = request.queryParams("description");

      if(name.equals("")) {
        model.put("formError", true);
        model.put("description", description);
        model.put("template", "templates/type-add.vtl");
      } else {
        type.update(name, description);
        type = Type.find(typeId);

        model.put("type", type);
        model.put("languages", type.getLanguages());
        model.put("update", true);
        model.put("template", "templates/type.vtl");
      }

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

  }
}
