class NetworkAdapter {
  NetworkAdapter._internal();
  
  static final NetworkAdapter instance = NetworkAdapter._internal();

  factory NetworkAdapter() => instance;


  static NetworkAdapter getInstance() {
    return instance;
  }
}