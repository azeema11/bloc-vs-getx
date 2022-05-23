class Config {
  Config._();

  static const String appName = "World Time Getx";
  static const String _baseURL = "http://worldtimeapi.org/api/timezone/";
  static apiURL(String url) => '$_baseURL$url';
}
