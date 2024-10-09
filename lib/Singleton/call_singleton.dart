import 'package:firstflutterapp/Singleton/classic_singleton.dart';
import 'package:firstflutterapp/Singleton/factory_singleton.dart';

void main() {
  ClassicSingleton s1 = ClassicSingleton.instance;
  ClassicSingleton s2 = ClassicSingleton.instance;


  FactorySingleton f1 = FactorySingleton();
  FactorySingleton f2 = FactorySingleton();
  print(s1 == s2);
  print(f1 == f2);

  Person p = Person('akshay');
  Person p1 = Person.DefaultPerson();

  var macbook = MacBook();
 // Person p1 = Person.namedConstructor(name: 'akshay', salary: 1000);

  Dog dog = Dog();
  dog.eat();


  String? name;
// Assigning John to name
  name = "John";
// Assigning null to name
  name = null;
// Checking if name is null using if statement
  if(name == null){
    print("Name is null");
  }
// Using ?? operator to assign a default value
  print(name ??= "Stranger");

  Singleton s21 = Singleton();
  Singleton s22 = Singleton();

  print("Singleton ${s21 == s22}");

}

class Laptop {
  // Constructor
  Laptop() {
    print("Laptop constructor");
  }
}

class MacBook extends Laptop {
  // Constructor
  MacBook() {
    print("MacBook constructor");
  }
}

class Person {
  String _name;

  int _salary;

  String get name => _name;
  int get salary => _salary;

  set name (String name) => _name = name;
  set salary (int salary) => _salary = salary;

  Person(this._name,[this._salary = 0]);

  factory Person.DefaultPerson() {
    return Person('akshay', 1000);
  }
}

class Animal {
void eat() {
  print("Animal is eating");
}
}

class Dog extends Animal {

  @override
  void eat() {
    print("Dog is eating");
  }
}

class Area {
  final int length;
  final int breadth;
  final int area;

  // private constructor
  const Area._internal(this.length, this.breadth) : area = length * breadth;

  // Factory constructor
  factory Area(int length, int breadth) {
    if (length < 0 || breadth < 0) {
      throw Exception("Length and breadth must be positive");
    }
    // redirect to private constructor
    return Area._internal(length, breadth);
  }
}


class Singleton {
  static final Singleton _instance = Singleton._internal();

  Singleton._internal();

  factory Singleton() {
    return _instance;
  }
}