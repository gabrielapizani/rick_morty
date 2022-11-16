import 'package:flutter/material.dart';

import '../../components/loader/loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!Navigator.of(context).canPop()) {
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Loader(),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Carregando...',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 22.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
