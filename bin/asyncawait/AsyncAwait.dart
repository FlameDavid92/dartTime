// This example shows how *not* to write asynchronous Dart code.

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      Duration(seconds: 2),
      () => 'Large Latte',
    );

/*Introducing futures*/
Future<void> fetchUserOrder2() {
  // Imagine that this function is fetching user info from another service or database.
  return Future.delayed(Duration(seconds: 2), () => print('Large Latte'));
}

Future<void> fetchUserOrder3() {
// Imagine that this function is fetching user info but encounters a bug
  return Future.delayed(Duration(seconds: 2),
      () => throw Exception('Logout failed: user ID is invalid'));
}

Future<void> main() async {
  //fetchUserOrder2();
  //fetchUserOrder3();
  print('Fetching user order...');
  print(await createOrderMessage());
  print('');
  countSeconds(4);
  await printOrderMessage();
  print('');
  await printOrderMessage2();
}

/*Execution within async functions*/
Future<void> printOrderMessage() async {
  print('Awaiting user order...');
  var order = await fetchUserOrder4();
  print('Your order is: $order');
}

Future<String> fetchUserOrder4() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}

/*es*/
Future<String> fetchRole() async {
    return 'tester';
}

Future<int> fetchLoginAmount() async {
  return 42;
}

// Part 1
// You can call the provided async function fetchRole()
// to return the user role.
Future<String> reportUserRole() async {
  // TO DO: Your implementation goes here.
  var role = await fetchRole();
  return 'User role: $role';
}

// Part 2
// Implement reportLogins here
// You can call the provided async function fetchLoginAmount()
// to return the number of times that the user has logged in.
Future<String> reportLogins() async{
  var nLogins = await fetchLoginAmount();
  return 'Total number of logins: $nLogins';
}

/*async and await with try-catch*/
Future<void> printOrderMessage2() async {
  try {
    var order = await fetchUserOrder5();
    print('Awaiting user order...');
    print(order);
  } catch (err) {
    print('Caught error: $err');
  }
}

Future<String> fetchUserOrder5() {
  // Imagine that this function is more complex.
  var str = Future.delayed(
      Duration(seconds: 4),
          () => throw 'Cannot locate user order');
  return str;
}

/*Practice handling errors*/
Future<String> fetchNewUsername() async {
  return 'newusername';
}
// Implement changeUsername here
Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  }catch (e) {
    return e.toString();
  }
}


/*Exercise: Putting it all together*/


// Part 1
String addHello(String name){
  return 'Hello $name';
}

// Part 2
// You can call the provided async function fetchUsername()
// to return the username.
Future<String> greetUser() async {
  String username = await fetchNewUsername();
  return addHello(username);
}

Future<String> logoutUser() async { return 'newusername'; }
// Part 3
// You can call the provided async function logoutUser()
// to log out the user.
Future<String> sayGoodbye() async {
  try {
    String logout = await logoutUser();
    return '$logout Thanks, see you next time';
  }catch (e) {
    return 'Fail!';
  }
}