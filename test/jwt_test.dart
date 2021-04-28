import 'package:test/test.dart';

import 'package:jwt/jwt.dart' as jwt;

void main() {
  test("Decodes a JWT and returns its payload", () {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
    expect(
      jwt.parsePayload(token),
      {
        "sub": "1234567890",
        "name": "John Doe",
        "iat": 1516239022,
      },
    );
  });

  test("Decodes a JWT and returns its header", () {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
    expect(
      jwt.parseHeader(token),
      {
        "alg": "HS256",
        "typ": "JWT",
      },
    );
  });
}
