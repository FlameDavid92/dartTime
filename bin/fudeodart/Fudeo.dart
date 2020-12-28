void main(List<String> arguments) {
  print("Fudeo");

  int integer = 1;
  double doubleNumber = 1.0;
  //È uguale al precedente grazie al type coercion verso double!
  double doubleNumber2 = 1;
  String s1 = 'ciao';
  String s2 = "ciao";
  bool truebool = true;

  final list = [1,2,3];
  final list2 = ["s1","s2","s3"];
  final list3 = [1,2,"s1",true];

  final set = {"hello", "world", "hello"};
  //{"hello","world"}

  final map = {
    "user": "Davide",
    "profile": { "age": 28}
  };

  int multiplyBy3(int n) => n*3;

  int multiplyBy3V2(int n){
    return n*3;
  }

  void greetUser(String firstName, { String lastName }) {
    print("Hello $firstName ${ lastName ?? '' }"); //String interpolation
  }
  void greetUser2(String firstName, { String lastName = "" }) {
    print("Hello $firstName $lastName"); //String interpolation
  }

  greetUser("Davide",lastName:"Figuccia");
  greetUser2("Davide");

  final l1 = [1,2,3,4,5];
  l1.forEach((el) => print(el));
  print("\n");
  void forEach2(List<int> list, void Function(int) handler){
    for(int i=0; i<list.length; i++){
      handler(list[i]);
    }
  }
  forEach2(l1, (el)=>print(el));

  final name = "Davide";
  if(name == "Davide"){
    print("Ciao Davide!!!");
  }
  try {
    functExcept();
  }catch(e){
    print(e.errMsg());
  }finally{
    print('Ending requested operation.....');
  }

  final person = Person.withNames(name: 'Davide', age: 28);
  person.printName();
  final student = Student('Alessio', 29);
  student.printName();
  final student2 = Student2('Chiara',28);
  print("");
  student2
    ..printName()
    ..printAge(); /*cascade operator*/

  printElem("Hello");
  printElem([1,5,8,9,10]);
  printElem({1:"a",2:"b"});

  final res = myMap([1,2,3], (el) => el*2);
  print(res);

  /*async*/
  final futureName = getName();
  print(futureName);
  futureName.then((name3) => print(name3));
  myPrintName();
  myPrintNumbers(10);
}

class NameException implements Exception {
  String errMsg() => 'Bla bla bla...';
}
void functExcept(){
  throw new NameException();
}

class Person {
  String name;
  int age;

  /*Person(String name, int age){
    this.name = name;
    this.age = age;
  }*/
  //Person(String name, int age) : name = name, age = age;
  //Person(this.name, this.age);
  Person(this.name, this.age) : assert(age >= 18);

  Person.withNames({this.name, this.age});

  void printName(){
    print(this.name);
  }
}

class Student extends Person {
  Student(String name, int age) : super(name, age);

}

class Student2 implements Person {
  String name;
  int age;
  Student2(this.name, this.age);
  @override
  void printName() {
    print("$name (override)");
  }

  void printAge() {
    print(age);
  }
}

void printElem<T>(T elem) {
  print(elem);
}

List<R> myMap<T, R>(List<T> list, R Function(T) mapper) {
  List<R> resultList = [];
  for(int i=0; i<list.length; i++) {
    resultList.add(mapper(list[i]));
  }
  return resultList;
}

Future<String> getName() async {
  return "Davide (async)";
}

void myPrintName() async{
  final name = await getName();
  print(name);
}

Stream<int> getNumbers() async* {
  int counter = 0;
  while(true){
    counter++;
    yield counter;
  }
}

void myPrintNumbers(int n) async {
  print(await getNumbers().take(n).toList());
}