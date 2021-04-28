import 'dart:convert';

/// Parses the given [token] and retrieves the payload data it carries.
/// Returns null if the provided token is not correctly formatted or null.
Map<String, dynamic> parsePayload(String token) {
  List<String> sections = _parse(token);

  // Just return null if parsing failed.
  if (sections == null) {
    return null;
  }

  // Retrieve encoded payload.
  final String rawPayload = sections[1];

  // Safety feature: normalize raw data so that it's correctly decoded.
  final String normalizedPayload = base64Url.normalize(rawPayload);

  // Decode the normalized data.
  final String decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));

  // Convert decoded data to JSON.
  final payload = json.decode(decodedPayload);

  return payload;
}

/// Parses the given [token] and retrieves the header data it carries.
/// Returns null if the provided token is not correctly formatted or null.
Map<String, String> parseHeader(String token) {
  List<String> sections = _parse(token);

  // Just return null if parsing failed.
  if (sections == null) {
    return null;
  }

  // Retrieve encoded header.
  final String rawHeader = sections[0];

  // Safety feature: normalize raw header data so that it's correctly decoded.
  final String normalizedHeader = base64Url.normalize(rawHeader);

  // Decode the normalized data.
  final String decodedHeader = utf8.decode(base64Url.decode(normalizedHeader));

  // Convert decoded data to JSON.
  final header = json.decode(decodedHeader);

  return header;
}

/// Splits the given [token] into its sections.
/// Returns null if the provided token is not correctly formatted or null.
List<String> _parse(String token) {
  // Just returns null if the provided token is null itself.
  if (token == null) {
    return null;
  }

  // Splits the token into its three parts.
  final List<String> sections = token.split(".");

  // Return null if more or less than three parts were found.
  if (sections.length != 3) {
    return null;
  }

  return sections;
}