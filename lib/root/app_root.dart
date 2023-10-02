import 'package:flutter/material.dart';
import 'package:flutter_application_27/cubit/products_cubit.dart';
import 'package:flutter_application_27/screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductsCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        )); 
    
    //  MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: SplashScreen(),
    // );
  }
}