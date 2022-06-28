import 'package:flutter_modular/flutter_modular.dart';

import '../movie/movie_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/movie_list/', module: MovieModule()),
      ];
}
