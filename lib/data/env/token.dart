import 'package:envied/envied.dart';

part 'token.g.dart';

@Envied(path: '.env')
abstract class Token {
  @EnviedField(varName: 'TOKEN')
  static const String token = _Token.token;
}
