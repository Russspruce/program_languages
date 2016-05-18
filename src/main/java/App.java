import java.util.Map;
import java.util.HashMap;
import java.util.List;

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

    get("/career/add", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("career", request.session().attribute("career"));
      model.put("description", "");
      model.put("template", "templates/career-add.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/career/add", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String title = request.queryParams("title").trim();
      String description = request.queryParams("description");

      if(title.equals("")) {
        model.put("formError", true);
        model.put("description", description);
        model.put("template", "templates/career-add.vtl");
      } else {
        Career newCareer = new Career(title, description);
        newCareer.save();

        model.put("career", newCareer);
        model.put("languages", newCareer.getLanguages());
        model.put("new", true);
        model.put("template", "templates/career.vtl");
      }

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
      model.put("languages", career.getLanguages());
      model.put("template", "templates/career.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/career/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int careerId = Integer.parseInt(request.params(":id"));
      Career career = Career.find(careerId);
      model.put("career", career);
      model.put("description", career.getDescription());
      model.put("template", "templates/career-edit.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/career/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int careerId = Integer.parseInt(request.params(":id"));
      Career career = Career.find(careerId);
      String title = request.queryParams("title").trim();
      String description = request.queryParams("description");

      if(title.equals("")) {
        model.put("formError", true);
        model.put("description", description);
        model.put("template", "templates/career-edit.vtl");
      } else {
        career.update(title, description);
        career = Career.find(careerId);

        model.put("career", career);
        model.put("languages", career.getLanguages());
        model.put("update", true);
        model.put("template", "templates/career.vtl");
      }

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/career/:id/delete", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();

      int careerId = Integer.parseInt(request.params(":id"));
      Career career = Career.find(careerId);

      career.delete();

      model.put("careers", Career.all());
      model.put("deleted", true);
      model.put("template", "templates/careers.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/associate/careers/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Career career = Career.find(Integer.parseInt(request.params(":id")));

      model.put("career", career);
      model.put("languages", Language.all());
      model.put("template", "templates/associate-careers.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/associate/careers/:id", (request, response) -> {
      int careerId = Integer.parseInt(request.params(":id"));
      Career career = Career.find(careerId);

      career.removeAllLanguages();
      String[] languageIds = request.queryParamsValues("languages");
      if (languageIds != null){
        for (String languageId : languageIds) {
          career.addLanguage(Language.find(Integer.parseInt(languageId)));
        }
      }
      response.redirect("/career/" + careerId);
      return null;
    });

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

    get("/program/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int programId = Integer.parseInt(request.params(":id"));
      Program program = Program.find(programId);
      model.put("program", program);
      model.put("languages", program.getLanguages());
      model.put("template", "templates/program.vtl");
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

    get("/associate/programs/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Program program = Program.find(Integer.parseInt(request.params(":id")));

      model.put("program", program);
      model.put("languages", Language.all());
      model.put("template", "templates/associate-programs.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/associate/programs/:id", (request, response) -> {
      int programId = Integer.parseInt(request.params(":id"));
      Program program = Program.find(programId);

      program.removeAllLanguages();
      String[] languageIds = request.queryParamsValues("languages");
      if (languageIds != null){
        for (String languageId : languageIds) {
          program.addLanguage(Language.find(Integer.parseInt(languageId)));
        }
      }
      response.redirect("/program/" + programId);
      return null;
    });

    get("/types", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("types", Type.all());
      model.put("template", "templates/types.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/programs", (request, response) -> {
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
      model.put("template", "templates/type-edit.vtl");
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
        model.put("template", "templates/type-edit.vtl");
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

    get("/program/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int programId = Integer.parseInt(request.params(":id"));
      Program program = Program.find(programId);
      model.put("program", program);
      model.put("description", program.getDescription());
      model.put("template", "templates/program-edit.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/program/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int programId = Integer.parseInt(request.params(":id"));
      Program program = Program.find(programId);
      String name = request.queryParams("name").trim();
      String description = request.queryParams("description");
      String url = request.queryParams("url");

      if(name.equals("")) {
        model.put("formError", true);
        model.put("description", description);
        model.put("template", "templates/program-edit.vtl");
      } else {
        program.update(name, description, url);
        program = Program.find(programId);

        model.put("program", program);
        model.put("languages", program.getLanguages());
        model.put("update", true);
        model.put("template", "templates/program.vtl");
      }

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/type/:id/delete", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();

      int typeId = Integer.parseInt(request.params(":id"));
      Type type = Type.find(typeId);

      type.delete();

      model.put("types", Type.all());
      model.put("deleted", true);
      model.put("template", "templates/types.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/program/:id/delete", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();

      int programId = Integer.parseInt(request.params(":id"));
      Program program = Program.find(programId);

      program.delete();

      model.put("programs", Program.all());
      model.put("deleted", true);
      model.put("template", "templates/programs.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

  }
}
