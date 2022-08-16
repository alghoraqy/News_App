import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/bloc/cubit.dart';
import 'package:news_app_api/bloc/states.dart';
import 'package:news_app_api/modules/pages/search.dart';
import 'package:news_app_api/network/remote/dio_helper.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, NewsAppStates>(
      listener: (context, states){},
      builder: (context, states){
        AppCubit cubit =AppCubit.get(context);
        return Scaffold(
        appBar: AppBar(
          title:  Text(
            cubit.titles[cubit.current]
          ),
          actions: [
            IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context){return SearchScreen();}));
            }, icon: Icon(Icons.search) ,),
            IconButton(
              onPressed: (){
             MasterAppcubit.get(context).changethememode();
            }, icon: const Icon(Icons.brightness_4_outlined),),
          ],  
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.current,
          onTap: (index){
            cubit.changestate(index);
          },
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items:cubit.bottomItem
          ),
        body: cubit.screens[cubit.current],
      );
      },
    );
  }
}