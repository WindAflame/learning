
enum Day {  Lundi,  Mardi,  Mercredi, Jeudi, Vendredi, Samedi, Dimanche }
void main() {  
    // Variables
    var myAge = 32; // inference
    var myName = "Endy";
    int age = 32;
    double e = 2.7;
    const test = "Test";
    final tests = "Tests";
    final aDay = Day.Lundi;
    print(aDay);
    print(Day.values);
    print(Day.Lundi.index);
    bool val = true;
    dynamic message = 'Hello, World';
    message = 8; 
    
    // Valeur Null
    int age;
    var error = err ?? "No error";
    print(age?.my)
    
    // Operateurs
    1+1;
    1-1;
    1*1;
    1/1;
    1%1;
    var answer = 84.0 / 2;
    1==1;
    1!=1;
    1>1;
    1<1;
    1<=1;
    1>=1;
    answer++;
    ++answer;
    answer += 1;
    && // AND
    || // OR
    val = !val;

    // Chaîne de caractère
    var name = "Test";
    String aName = "aTest";
    var text = "$name $aName";
    var aText = 'can\'t\n';
    var newText = "Mass" + " times";

    // Fonctions
    bool isBanana(String fruit) {
        return fruit == "banana";
    }
    print(isBanana("banana"));
    String fullName(String first, String last, [String title = ""]) {
        return '${title == "" ? "" : title + ': '}$first $last';
    }
    print(fullName("Endy", "WindAflame"
                    , "Consultant"));
    print(fullName("Endy", "WindAflame"));
    
    String fullName2(String first, String last,
                    {String title = ""}) {
        return '${title == Null ? "" : title + ': '}$first $last';
    }
    print(fullName2("Endy", "WindAflame",
                    title: "Consultant"));
    print(fullName2("Endy", "WindAflame"));
    String name(
        String first, 
        String last, 
        String Function(String, String) aFunction
    ) {
        return aFunction(first, last);
    }
    print(name("Endy", "WindAflame", fullName2));
}














