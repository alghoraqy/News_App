import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/bloc/cubit.dart';
import 'package:news_app_api/bloc/states.dart';
import 'package:news_app_api/modules/home_layout.dart';
import 'package:news_app_api/modules/pages/search.dart';
import 'package:news_app_api/network/local/sharedpref.dart';
import 'package:news_app_api/network/remote/dio_helper.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
   bool? isDark = CacheHelper.getData(key: 'isdark');
  runApp(MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  
   bool? isDark ;
   MyApp({
     this.isDark,
   });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) {return AppCubit()..getbusinessData()..getSportsData()..getScienceData();}),
        BlocProvider(create: (BuildContext context) {return MasterAppcubit()..changethememode(fromshared: isDark);})
      ],
      child: BlocConsumer<MasterAppcubit, MasterAppcubitstate>(
        listener: (context, states){},
        builder:(context, states) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.teal.shade300,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              
            ),
            scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                headline1: TextStyle(
                  fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black
                   ),
              ),
             
              appBarTheme: AppBarTheme(
                 iconTheme: const IconThemeData(color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.teal.shade300,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.teal.shade300,
                  titleTextStyle:
                      const TextStyle(fontSize: 30, color: Colors.black))),
          darkTheme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
          
            ),
            scaffoldBackgroundColor: Colors.black,
              textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.white
                   ),
              ),
              iconTheme: IconThemeData(color: Colors.white),
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: Colors.black,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  titleTextStyle:
                      const TextStyle(fontSize: 30, color: Colors.white))),
          themeMode: MasterAppcubit.get(context).isdark ? ThemeMode.dark :ThemeMode.light,
          home:   const HomeScreen(),
        );
        }
      ),
    );
  }
}
