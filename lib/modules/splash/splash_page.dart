import '../../application/auth/auth_provider.dart';
import 'package:flutter/material.dart';

import '../../application/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required AuthProvider authProvider})
      : _authProvider = authProvider,
        super(key: key);
  final AuthProvider _authProvider;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget._authProvider.initialLoad().then(
          (value) => Navigator.pushReplacementNamed(context, AppRoutes.home));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: MediaQuery.of(context).size.width * .4,
            ),
            const Text(
              'Book Store - Leonardo Serrano',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
