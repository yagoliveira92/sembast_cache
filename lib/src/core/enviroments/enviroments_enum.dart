enum EnvironmentEnum {
  production(
    type: 'production',
    apiBaseUrl: 'https://api.openweathermap.org/data/2.5/',
    apiKey: String.fromEnvironment('WEATHER_API_KEY'),
  ),
  development(
    type: 'development',
    apiBaseUrl: 'https://api.openweathermap.org/data/2.5/',
    apiKey: String.fromEnvironment('WEATHER_API_KEY'),
  );

  const EnvironmentEnum({
    required this.type,
    required this.apiBaseUrl,
    required this.apiKey,
  });

  final String type;
  final String apiBaseUrl;
  final String apiKey;

  EnvironmentEnum envFromString(String value) {
    switch (value) {
      case "PROD":
        return EnvironmentEnum.production;
      case "DEV":
        return EnvironmentEnum.development;
      default:
        throw ArgumentError("Invalid status string: $value");
    }
  }
}

extension EnvironmentsEnumMethods on EnvironmentEnum {
  static EnvironmentEnum envFromString(String value) {
    switch (value) {
      case "PROD":
        return EnvironmentEnum.production;
      case "DEV":
        return EnvironmentEnum.development;
      default:
        throw ArgumentError("Invalid status string: $value");
    }
  }
}
