import 'package:envied/envied.dart';
part 'env.g.dart';

@envied(path:'.env')
abstract class Env{
  @EnviedField(varName:'OPENAI_API_KEY')
  static const apiKey = _Env.apiKey;
}