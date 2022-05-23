import '../blocs/choose_location/choose_location.dart';
import '../blocs/home/home.dart';
import '../blocs/loading/loading.dart';

class Routes {
  Routes._();

  static final routes = {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  };
}
