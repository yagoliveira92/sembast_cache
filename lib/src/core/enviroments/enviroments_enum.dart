enum EnvironmentEnum {
  constants(
    apiBaseUrl: 'https://api.hgbrasil.com/weather',
    apiKey: String.fromEnvironment('WEATHER_API_KEY'),
    imageUrl: 'https://assets.hgbrasil.com/weather/icons/conditions/',
    moonPhaseUrl:  'https://assets.hgbrasil.com/weather/icons/moon/',
  );

  const EnvironmentEnum({
    required this.apiBaseUrl,
    required this.apiKey,
    required this.imageUrl,
    required this.moonPhaseUrl,

  });

  final String apiBaseUrl;
  final String apiKey;
  final String imageUrl;
  final String moonPhaseUrl;
}