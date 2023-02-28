/// Enum comportant l'ensemble des thèmes de notre TODO List
enum Theme { course, sport, travail }

/// Classe abstraite servant à concevoir les Tâches de la TODO List
abstract class Tache {
  String name = "";
  Theme theme;
  
  Tache(this.name, this.theme);
  
  @override
  String toString() {
    return "{name: $name, theme: $theme}";
  }
}
/// Classe implémentant [Task] et appartenant à la catégorie [CategoryEnum.shopping]
class Course extends Tache {
  Course(String name) : super(name, Theme.course);
}

/// Classe implémentant [Task] et appartenant à la catégorie [CategoryEnum.sport]
class Sport extends Tache {
  Sport(String name) : super(name, Theme.sport);
}

/// Classe implémentant [Task] et appartenant à la catégorie [CategoryEnum.work]
class Travail extends Tache {
  Travail(String name) : super(name, Theme.travail);
}

void main() {
  List<Tache> taskList = [];
  taskList.add(Course("Kinder Bueno"));
  taskList.add(Sport("Triathlon"));
  taskList.add(Course("KitKat"));
  taskList.add(Sport("Trail"));
  taskList.add(Course("Nesquik"));
  taskList.add(Course("Mars"));
  taskList.add(Course("Twix"));
  taskList.add(Sport("Marathon"));
  taskList.add(Course("Bounty"));
  print(taskList);
}