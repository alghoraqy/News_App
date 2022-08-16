import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/bloc/cubit.dart';
import 'package:news_app_api/bloc/states.dart';
import 'package:news_app_api/components/components.dart';
class SportsScreen extends StatelessWidget {
  const SportsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, NewsAppStates>(
      listener: (context, states){} ,
      builder: (context, states){
        return AppCubit.get(context).sports.isNotEmpty ? ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
          return articleItem(AppCubit.get(context).sports[index],context); 
        },
         separatorBuilder: (context, index){
           return myDivider(context);
         },
          itemCount: AppCubit.get(context).sports.length
          ): const Center(child: CircularProgressIndicator(
            color: Colors.black,)) ;
      },
    );
  }
}