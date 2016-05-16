import java.util.ArrayList;
import java.util.List;
import org.sql2o.*;

public class Program {
  private String name;
  private String description;
  private int id;

  public Program (String name, String description) {
    this.name = name;
    this.description = description;
  }

  public String getName() {
    return name;
  }

  public String getDescription() {
    return description;
  }

  public int getId() {
    return id;
  }
}
