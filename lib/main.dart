import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/Cubit_screen.dart';
import 'package:untitled2/cubit/second_cubit.dart';
import 'package:untitled2/screnss/new_screen.dart';
import 'package:untitled2/cubit/state.dart';
import 'Dio.dart';
import 'bloc_observer.dart';

void main() {


  Diohelper.init();
  Bloc.observer=MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => modecubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => Newscubit(),
        ),
      ],
        child: BlocConsumer<modecubit, modestate>(
        listener: (context, state) {},
         builder: (context, state) =>
        MaterialApp(

        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blueGrey
          ),

          appBarTheme: AppBarTheme(

            backgroundColor: Colors.blueGrey,
            titleTextStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),
            systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness:Brightness.light ,
              statusBarColor: Colors.grey, ),
            elevation: 0.0,
          ),



        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Color(0xFF32373A),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.teal,
              elevation: 20.0,
              backgroundColor:Color(0xFF333739)
          ),

          appBarTheme: AppBarTheme(

              backgroundColor:Color(0xFF333739) ,
              titleTextStyle: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness:Brightness.light ,
                  statusBarColor: Color(0xff333739) ),
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.white)
          ),

        ),
        themeMode: modecubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

        home:news(),


      )

    ),
    );
  }
}
