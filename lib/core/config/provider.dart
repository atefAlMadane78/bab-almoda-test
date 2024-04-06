import 'package:babalomoda/feature/home/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> init() {
    return [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
    ];
  }
}
