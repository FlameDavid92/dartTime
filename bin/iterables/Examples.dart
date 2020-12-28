void main() {
  /*Reading elements*/
  var iterable = ['Salad', 'Popcorn', 'Toast'];
  /*Using a for-in loop*/
  for (var element in iterable) {
    print(element);
  }
  /*Using first and last*/
  print('The first element is ${iterable.first}');
  print('The last element is ${iterable.last}'); /*poco efficiente poiché itera tutta lista per arrivare alla fine*/

  if (iterable.any((element) => element.contains('a'))) {
    print('At least one element contains "a"');
  }

  if (iterable.every((element) => element.length >= 5)) {
    print('All elements have length >= 5');
  }

  if (iterable.any((element) => element.contains('Z'))) {
    print('At least one element contains "Z"');
  } else {
    print('No element contains "Z"');
  }

  /*Using firstWhere()*/
  main2();

  /*Using where()*/
  main3();

  /*Using takeWhile()-skipWhile()*/
  main4();

  /*Using map to change elements*/
  main5();
}

bool predicate(String element) {
  return element.length > 5;
}

void main2() {
  var items = ['Salad', 'Popcorn', 'Toast', 'Lasagne'];

  // You can find with a simple expression:
  var element1 = items.firstWhere((element) => element.length > 5);
  print(element1);

  // Or try using a function block:
  var element2 = items.firstWhere((element) {
    return element.length > 5;
  });
  print(element2);

  // Or even pass in a function reference:
  var element3 = items.firstWhere(predicate);
  print(element3);

  // You can also use an `orElse` function in case no value is found!
  var element4 = items.firstWhere(
        (element) => element.length > 10,
    orElse: () => 'None!',
  );
  print(element4);
  items.any(predicate);
}

/*Practice writing a test predicate*/
// Implement the predicate of singleWhere
// with the following conditions
// * The element contains the character `'a'`
// * The element starts with the character `'M'`
String singleWhere(Iterable<String> items) {
  return items.singleWhere((element) => (element.contains('a') && element.startsWith('M')), orElse: () => 'None!');
}

/*Verify that an Iterable satisfies a condition*/
bool anyUserUnder18(Iterable<User> users) {
  // Implement this method
  return users.any((u) => u.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  // Implement this method
  return users.every((u) => u.age > 13);
}

class User {
  String name;
  int age;

  User(
      this.name,
      this.age,
      );
}

void main3() {
  var evenNumbers = [1, -2, 3, 42].where((number) => number.isEven);

  for (var number in evenNumbers) {
    print('$number is even.');
  }

  if (evenNumbers.any((number) => number.isNegative)) {
    print('evenNumbers contains negative numbers.');
  }

  // If no element satisfies the predicate, the output is empty.
  var largeNumbers = evenNumbers.where((number) => number > 1000);
  if (largeNumbers.isEmpty) {
    print('largeNumbers is empty!');
  }
}

void main4() {
  var numbers = [1, 3, -2, 0, 4, 5];

  var numbersUntilZero = numbers.takeWhile((number) => number != 0);
  print('Numbers until 0: $numbersUntilZero');

  var numbersAfterZero = numbers.skipWhile((number) => number != 0);
  print('Numbers after 0: $numbersAfterZero');

  var numbersUntilNegative =
  numbers.takeWhile((number) => !number.isNegative);
  print(numbersUntilNegative);
}

/*Filtering elements from a list*/
Iterable<User2> filterUnder21(Iterable<User2> users) {
  // Implement this method
  return users.where((u) => u.age > 20);
}

Iterable<User2> findShortNamed(Iterable<User2> users) {
  // Implement this method
  return users.where((u) => u.name.length < 4);
}

class User2 {
  String name;
  int age;

  User2(
      this.name,
      this.age,
      );
}

void main5(){
  var list = <int>[1, -2, 3, 42];
  var numbersByTwo = list.map((number) => number * 2);
  print('Numbers: $numbersByTwo.');
  print(list);
}

/*Mapping to a different type*/
Iterable<String> getNameAndAges(Iterable<User> users) {
  // implement this method
  return users.map((u) => '${u.name} is ${u.age}');
}

/**/
Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  // Implement this method
  return strings.map((s) => EmailAddress(s));
}

bool isValidEmailAddress(EmailAddress e){
  final String emailRegex = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  RegExp regExp = RegExp(emailRegex, caseSensitive: false);
  return regExp.hasMatch(e.address);
}

bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  // Implement this method
  return emails.any((e) => !isValidEmailAddress(e));
}

Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  // Implement this method
  return emails.where((e) => isValidEmailAddress(e));
}

class EmailAddress {
  String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EmailAddress &&
              address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() {
    return 'EmailAddress{address: $address}';
  }
}