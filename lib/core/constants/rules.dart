String extractPokemonId(String url) {
  final regex = RegExp(r'\/(\d+)\/$');
  final match = regex.firstMatch(url);
  return match?.group(1) ?? '';
}