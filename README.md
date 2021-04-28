# jwt

A basic and stateless JSON Web Token decoding library. Allows for easy and quick JWT decoding for those "I just need that simple thing" situations.

## Usage

The library exposes two high level functions for quick decoding.

Header:
```dart
import 'package:jwt/jwt.dart' as jwt;

String token;
Map<String, String> header = jwt.parseHeader(token);
```

Payload:
```dart
import 'package:jwt/jwt.dart' as jwt;

String token;
Map<String, dynamic> payload = jwt.parsePayload(token);
```
