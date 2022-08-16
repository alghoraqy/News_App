import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/bloc/cubit.dart';
import 'package:news_app_api/bloc/states.dart';
import 'package:news_app_api/components/components.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, NewsAppStates>(
      listener: (context, states){},
      builder: (context, states){
        return AppCubit.get(context).science.isNotEmpty ? ListView.separated(
        itemBuilder: (context, index){
          return articleItem(AppCubit.get(context).science[index], context);
        },
       separatorBuilder: (context,index){
         return myDivider(context) ;
       },
        itemCount: AppCubit.get(context).science.length
        ): const Center(child: CircularProgressIndicator(color: Colors.black,));
      },
    ); 
  }
}