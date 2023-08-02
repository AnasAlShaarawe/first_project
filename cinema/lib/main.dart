import 'package:cinema/features/home/cubit/home_cubit.dart';
import 'package:cinema/features/home/repo/home_repo.dart';
import 'package:cinema/features/home/view/main_page.dart';
import 'package:cinema/routes/app_router.dart';
import 'package:cinema/features/details/view/secound_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo()),
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: Color(0xff081933),


            hintColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}



