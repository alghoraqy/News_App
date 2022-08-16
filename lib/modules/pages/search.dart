import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/bloc/cubit.dart';
import 'package:news_app_api/bloc/states.dart';
import 'package:news_app_api/components/components.dart';
class SearchScreen extends StatelessWidget {

  TextEditingController controller =TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , NewsAppStates>(
      listener: (context, states){},
      builder:(context ,states){ 
        return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search'
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (value){
                   AppCubit.get(context).getsearch(value);
                },
                controller: controller,
                decoration: MasterAppcubit.get(context).isdark? InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search , color: Colors.white,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white)
                  )
                ): InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search , color: Colors.black,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black)
                  )
                ),
              ),
            ),
            const SizedBox(height: 10,),
             Expanded(
               child: ListView.separated
                   (
                     physics: const BouncingScrollPhysics(),
                     itemBuilder: (context,index){
                       return articleItem(AppCubit.get(context).search[index], context);
                     },
                    separatorBuilder: (context,index){
                      return myDivider(context);
                    },
                     itemCount: AppCubit.get(context).search.length
                     ),
             )
          ],
        ),
      );},
      );
  }
}