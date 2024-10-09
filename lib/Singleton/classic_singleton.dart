
class ClassicSingleton {
  static ClassicSingleton? _instance;

  ClassicSingleton._internal() {
    print("singleton");
  }

  static ClassicSingleton get instance {
    return _instance ??= ClassicSingleton._internal();
  }
}