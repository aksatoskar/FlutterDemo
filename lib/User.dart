


class User {
  int age;
  String name;

  User(this.age, this.name);

  User.anonymous(): this(0, 'anonymous');

}