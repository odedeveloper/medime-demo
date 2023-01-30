import 'package:medical360_oth/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          GetStorage().read("idToken") ?? "null",
        ),
      ),
    );
  }
}
