import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/bloc/states.dart';
import 'package:news_app_api/modules/pages/business.dart';
import 'package:news_app_api/modules/pages/settings.dart';
import 'package:news_app_api/modules/pages/sports.dart';
import 'package:news_app_api/modules/pages/science.dart';
import 'package:news_app_api/network/local/sharedpref.dart';
import 'package:news_app_api/network/remote/dio_helper.dart';
import 'package:news_app_api/network/remote/dio_helper.dart';

class AppCubit extends Cubit<NewsAppStates> {
  AppCubit() : super(IinitState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  int current = 0;
  void changestate(index) {
    current = index;
    emit(BottomNavstates());
  }

  List<String> titles = ['business', 'sports', 'Science',];
  List screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomItem = const [
    
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'business'),
        BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'science'),
  ];
  List<dynamic> business = [];
  void getbusinessData() {
    emit(GetBusinessDataStateLoading());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '32977a3d402f48fc916ddc737c1c2967',
    }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessDataStateSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessDataStateError(error.toString()));
    });
  }
  
  List <dynamic> sports =[]; 
  void getSportsData(){
    emit(GetSportsDataStateLoading());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'32977a3d402f48fc916ddc737c1c2967'
    }).then((value){
      sports =value.data['articles'];
      emit(GetSportsDataStateSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetSportsDataStateError(error.toString()));
    });
  }
 
 List<dynamic> science =[];
 void getScienceData(){
   emit(GetScienceDataStateLoading());
   DioHelper.getData(
     path:'v2/top-headlines' ,
      query: {
        'country':'eg',
        'category':'science',
        'apiKey':'32977a3d402f48fc916ddc737c1c2967',
      },
      ).then((value) {
        science =value.data['articles'];
        emit(GetScienceDataStateSuccess());
      }).catchError((error){
        print(error.toString());
        emit(GetScienceDataStateError(error.toString()));
      });
 }

 List<dynamic> search =[];
 void getsearch (value){
   emit(GetSearchDataStateLoading());
   DioHelper.getData(path: 'v2/everything',
    query: {
      'q':'$value',
      'apiKey':'32977a3d402f48fc916ddc737c1c2967'
    }).then((value) {
      search = value.data['articles'];
      emit(GetSearchDataStateSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetSearchDataStateError(error));
    });
 }




}

class MasterAppcubit extends Cubit<MasterAppcubitstate>{
  MasterAppcubit() : super(Initstate());

  static MasterAppcubit get(context){
    return BlocProvider.of(context); 
  }
   bool isdark=false;
void changethememode({bool? fromshared}){
  if (fromshared != null) {
    isdark =fromshared;
    emit(ChangethememodeState());
  }else{
    isdark = !isdark;
    CacheHelper.setData(key: 'isdark', value: isdark).then((value) {
    emit(ChangethememodeState());
    });
    }
    
    
  }
}