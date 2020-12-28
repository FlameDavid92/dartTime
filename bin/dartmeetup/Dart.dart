void main(List<String> arguments) {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }

  String heroName = "Flash";
  bool hasPowers = true;
  int age = 30;
  double speedForce = 299.792;
  List<String> justiceLeague = ["Flash","Superman","Wonder woman","Batman"];

  Map<String,String> favouriteHero = {
    "first" : "Flash",
    "second" : "Superman",
    "third" : "Green Lantern"
  };

  Map<int,String> favouriteHero2 = {
    1 : "Flash",
    2 : "Superman",
    3 : "Green Lantern"
  };

  Set<String> theFlash = {
    "Barry Allen", "Jay Garrick",
    "Wally West"
  };
  theFlash.add("Barry Allen");
  print(theFlash);

  var lanternName = "Hal Jordan";

  String anotherLanternName = "Kyle Rayner";

  print(2 + 3 == 5);
  print(2 - 3 == -1);
  print(2 * 3 == 6);
  print(5 / 2 == 2.5);
  print(5 ~/ 2 == 2);
  print(5 % 2 == 1);

  var greenLanternCorp, sinistroCorp;

  greenLanternCorp = 0;

  sinistroCorp = ++greenLanternCorp;
  sinistroCorp = --greenLanternCorp;
  sinistroCorp = greenLanternCorp++;
  sinistroCorp = greenLanternCorp--;

  print(2==2);
  print(2!=3);
  print(2<3);
  print(2<=3);
  print(3>2);
  print(3>=2);

  tellYourIdentityBatman("I'm Batman");

  tellYourIdentityFlash("Barry Allen");

  var villain = "Reverse Flash";
  if(villain == "Cheeta"){
    print('Cheeta');
  } else if(villain == "Lex Luthor"){
    print("Lex Luthor");
  } else {
    print("Reverse Flash");
  }


  villain == "Reverse Flash" ?
  "time travel" : "not time travel";

  var villains = ["Joker","Lex Luthor", "Cheeta", "Black Manta", "Sinestro"];

  for(var i=0; i<5; i++){
    print(villains[i]);
  }

  for(var v in villains){
    print(v);
  }

  villains.forEach((element) => print(element));

  var flash = Hero("Flash", "speed", true);
  var superman = Hero.short("Superman", "force", false);

  var greenLantern = Hero.justiceLeagueShort("Hal Jordan","power ring");

  superman.doSomething("Metropolis", peopleSaved:100, enemy: "Doomsday");

  superman.doSomething("Metropolis", enemy: "Lex Luthor");

  var supermanCity = "Metropolis";

  final flashCity = "Central City"; //costanti a tempo di runtime

  const batCity = "Gotham"; //costanti a tempo di compilazione
}

void tellYourIdentityBatman(String name){
  print(name);
}

tellYourIdentityFlash(name){
  print(name);
}

void tellYourIdentityWonderWoman(String name) => print(name);

class Hero {
  var name;
  var power;
  var isFavourite;

  /*Hero(String name, String power, bool isFavourite){
    this.name = name;
    this.power = power;
    this.isFavourite = isFavourite;
  }*/
  Hero(this.name,this.power,this.isFavourite);
  Hero.short(this.name,this.power,this.isFavourite);
  Hero.justiceLeagueShort(String name, String power) : this(name, power, true);


  void greet(){
    print("Hi, I'm $name and I'm the fastest man alive!");
    print("Hi, I'm "+name+" and I'm the fastest man alive!");
  }

  void doSomething(String city, {int peopleSaved = 0, String enemy}){
    print("In the city $city, ${this.name} fought $enemy saved $peopleSaved people");
  }
}
