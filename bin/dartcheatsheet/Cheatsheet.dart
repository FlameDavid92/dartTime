void main(List<String> arguments) {

}

/*String interpolation*/
String stringify(int x, int y) {
  // Return a formatted string here
  return '$x $y';
}

/*Null-aware operators*/
String foo = 'a string';
String bar; // Unassigned objects are null by default.
// Substitute an operator that makes 'a string' be assigned to baz.
String baz = foo ?? bar;
void updateSomeVars() {
  // Substitute an operator that makes 'a string' be assigned to bar.
  bar ??= 'a string';
}

/*Conditional property access*/
// This method should return the uppercase version of `str`
// or null if `str` is null.
String upperCaseIt(String str) {
  // Try conditionally accessing the `toUpperCase` method here.
  return str?.toUpperCase();
}

/*Collection literals*/
// Assign this a list containing 'a', 'b', and 'c' in that order:
final aListOfStrings = <String>['a','b','c'];

// Assign this a set containing 3, 4, and 5:
final aSetOfInts = <int>{3, 4, 5};

// Assign this a map of String to int so that aMapOfStringsToInts['myKey'] returns 12:
final aMapOfStringsToInts = <String, int> {'myKey':12};

// Assign this an empty List<double>:
final anEmptyListOfDouble = <double>[];

// Assign this an empty Set<String>:
final anEmptySetOfString = <String>{};

// Assign this an empty Map of double to int:
final anEmptyMapOfDoublesToInts = <double, int>{};

/*Arrow syntax*/
class MyClass {
  int _value1 = 2;
  int _value2 = 3;
  int _value3 = 5;

  // Returns the product of the above values:
  int get product => _value1 * _value2 * _value3;

  // Adds 1 to _value1:
  void incrementValue1() => _value1++;

  // Returns a string containing each item in the
  // list, separated by commas (e.g. 'a,b,c'):
  String joinWithCommas(List<String> strings) => strings.join(',');
}

/*Cascades*/
class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

BigObject fillBigObject(BigObject obj) {
  // Create a single statement that will update and return obj:
  return obj
    ..anInt=1
    ..aString='String!'
    ..aList=[3.0]
    ..allDone();
}

/*Getters and setters*/
class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  // Add a "total" getter here:
  /*double get total => _prices.reduce((value,el) => value+el);*/
  double get total => _prices.fold(0.0, (value,el) => value+el);

  // Add a "prices" setter here:
  set prices(List<double> newList) {
    if(newList.any((el) => el < 0)){
      _prices = newList;
      throw InvalidPriceException();
    }
    _prices = newList;
  }
}

/*Optional positional parameters*/
String joinWithCommas(int a, [int b, int c, int d, int e]) {
  return '$a'
      '${(b!=null) ? ",$b" : ""}'
      '${(c!=null) ? ",$c" : ""}'
      '${(d!=null) ? ",$d" : ""}'
      '${(e!=null) ? ",$e" : ""}';
  /*var total = '$a';
  if (b != null) total = '$total,$b';
  if (c != null) total = '$total,$c';
  if (d != null) total = '$total,$d';
  if (e != null) total = '$total,$e';
  return total;*/
}

/*Optional named parameters*/
class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  // Add your copyWith method here:
  MyDataObject copyWith({int newInt, String newString, double newDouble}){
    return MyDataObject(
        anInt : newInt ?? anInt,
        aString : newString ?? aString,
        aDouble : newDouble ?? aDouble
    );
  }
}

/*Exceptions*/
typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// Call logException to log an exception, and doneLogging when finished.
abstract class Logger {
  void logException(Type t, [String msg]);
  void doneLogging();
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  // Invoking this method might cause an exception. Catch and handle
  // them using try-on-catch-finally.
  try{
    untrustworthy();
  }on ExceptionWithMessage catch(e) {
    logger.logException(e.runtimeType,e.message);
  }on Exception {
    logger.logException(Exception);
  }finally {
    logger.doneLogging();
  }
}

/*Using this in a constructor*/
class MyClass2 {
  final int anInt;
  final String aString;
  final double aDouble;

  // Create a constructor here.
  MyClass2([this.anInt = 0, this.aString = "", this.aDouble = 0]);
}

/*Initializer lists*/
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  // Create a constructor with an initializer list here:
  FirstTwoLetters(String word)
      : assert(word.length > 1),
        letterOne = word[0],
        letterTwo = word[1];
}

/*Named constructors*/
class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  // Create a named constructor called "Color.black" here:
  Color.black(){ red=0; green=0; blue=0; }
}

/*Factory constructors*/
class IntegerHolder {
  IntegerHolder();

  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    switch(list?.length){
      case 1: return IntegerSingle(list[0]);
      case 2: return IntegerDouble(list[0],list[1]);
      case 3: return IntegerTriple(list[0],list[1],list[2]);
      default: return null;
    }
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a);
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b);
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c);
}

/*Redirecting constructors*/
class Color2 {
  int red;
  int green;
  int blue;

  Color2(this.red, this.green, this.blue);

  // Create a named constructor called "black" here and redirect it
  // to call the existing constructor
  Color2.black() : this(0, 0, 0);
}

/*Const constructors*/
class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;

  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
}