import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/bloc/cubit.dart';
import 'package:news_app_api/bloc/states.dart';
import 'package:news_app_api/components/components.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, NewsAppStates>(
      listener: (context,states){},
      builder: (context,states){
        return AppCubit.get(context).business.isNotEmpty  ?  ListView.separated
      (
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index){
          return articleItem(AppCubit.get(context).business[index], context);
        },
       separatorBuilder: (context,index){
         return myDivider(context);
       },
        itemCount: AppCubit.get(context).business.length
        ):const Center(child: CircularProgressIndicator(
          color: Colors.black,
        ));
      },
    );
  }
}