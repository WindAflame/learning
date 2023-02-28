void main() {  
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