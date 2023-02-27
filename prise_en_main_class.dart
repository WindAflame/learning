// Classe
abstract class AbstractPerson {
  String afirst = "";
}
mixin Report {
  bool hasName = false;
  bool doIHaveName() => hasName;
}
// class > extends > with > implements
class Person with Report implements AbstractPerson  {
  @override
  String afirst;
  String last;
  String title = "NoTitle";
  
  String get first => afirst;
  set first(String value) {
    afirst = value;
  }
  
  String get fullname => '$afirst $last';
  
  Person(this.afirst, this.last);
  Person.fromOptionnal(
    {this.afirst = "", this.last = ""}
  );
  factory Person.fromJson(Map json) {
    return Person(json['first'], json['last']);
  }
  // Erreur car déjà existante
  // Person(this.afirst, this.last, String aValue)
  String _revertedToString() {
    return "$title: $last $first";
  }
  String toString() {
    return "$title: $first $last";
  }
  
}

class Collab extends Person {
  Collab(String first, String last) :
    super(first, last) {
    this.title = "Collaborateur";
    this.hasName = true;
  }
}
const dynamic json = {
  "first": "Endy",
  "last": "WindAflame",
  "stuff": "Some stuff"
};
void main() {
  //print(Person("Endy", "WindAflame").toString());
  
  // print(Person.fromOptionnal(
  //  afirst: "Endy", last: "WindAflame"
  //).toString());
  //print(Collab("Endy", "WindAflame").toString());
  //print(Collab("Endy", "WindAflame")._revertedToString());
  var o = Person.fromJson(json);
  print(o.doIHaveName());
  var o2 = Collab("Endy", "WindAflame");
  print(o2.doIHaveName());
}

while(cond) {}
do {} while(cond)
for (var, cond, inc) {}
for (var in enum) {}
var.forEach(print)
var.forEach((v) => print(v))
switch() {
  case :
      break;
  default:
      break;
}

List<String> value = List<String>(1);
value[0] = "v";
value.first
value.isEmpty
value.firstWhere()
Map json;
















