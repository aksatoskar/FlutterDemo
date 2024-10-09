
class FactorySingleton {
  static final FactorySingleton _instance = FactorySingleton._internal();

  FactorySingleton._internal() {
    print("singleton");
  }

  factory FactorySingleton() {
    return _instance;
  }
}