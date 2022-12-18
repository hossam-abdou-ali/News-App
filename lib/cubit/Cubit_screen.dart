

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/screns_models/search_model.dart';
import 'package:untitled2/screnss/business_screen.dart';
import 'package:untitled2/screns_models/business_model.dart';

import 'package:untitled2/cubit/state.dart';

import '../screns_models/science_model.dart';
import '../screns_models/sport_model.dart';
import '../screnss/sport_screen.dart';
import '../screnss/science_screen.dart';
import '../Dio.dart';

class Newscubit extends Cubit<Newsstate> {
  Newscubit() :super(Newsintial());

  static Newscubit get(context) => BlocProvider.of(context);


  String title='';
  String image='';
  int currentIndex =0;


  List <BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(icon: Icon(Icons.business,),label:'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label:'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label:'Science'),
  ];

  void change(int index) {
    emit(changestLoading());
    currentIndex=index;
    emit(changest());
  }

  //object mn al class
  ArticleModel? articleModel;

  Future<void> businessBut() async{
    emit(GetBusinessLoading());
    await Diohelper.getData(
        url: 'v2/top-headlines',
        query:{'country':'eg',
          'category':'business',
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }
    ).then((value) {
      articleModel = ArticleModel.fromJson(value.data);
      print(value.data);
      print(articleModel);
      print('not yet');
      /*business=value.data['articles'];
      print(business[0]['title']);*/
      emit(GetBusinessSuc());
    }
    ).catchError((error)
    {
      print(error.toString());
      print('error here lllll');
      emit(GetBusinessError(error.toString()) );
    }
    );

  }


  ScienceModel? scienceModel;
  Future<void> ScienceBut() async{

    emit(GetScienceLoading());
    await Diohelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'Science',
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }
    ).then((value) {
      scienceModel = ScienceModel.fromJson(value.data);
      print(value.data);
      print('Science yet');
      /*business=value.data['articles'];
      print(business[0]['title']);*/
      emit(GetScienceSuc());
    }
    ).catchError((error)
    {
      print(error.toString());
      print('error here scienccce');
      emit(GetScienceError(error.toString()) );
    }
    );

  }


  SportModel? sportModel;
  Future<void> SportBut() async{

    emit(GetSportLoading());
    await Diohelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sport',
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }
    ).then((value) {
      sportModel = SportModel.fromJson(value.data);
      print(value.data);
      print('sport yet');
      /*business=value.data['articles'];
      print(business[0]['title']);*/
      emit(GetSportSuc());
    }
    ).catchError((error)
    {
      print(error.toString());
      print('error here lllllkk');
      emit(GetSportError(error.toString()) );
    }
    );

  }




  Searchmodel? searchmodel;

  Future<void> searchbut(String value) async
  {
    emit(searchloading());
    await Diohelper.getData(
        url:'v2/everything',
        query:{
          'q':'$value',
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }
    ).then((value) {
      searchmodel = Searchmodel.fromJson(value.data);
      print(value.data);
      print('Search yet');
      /*business=value.data['articles'];
      print(business[0]['title']);*/
      emit(searchSuc());
    }
    ).catchError((error)
    {
      print(error.toString());
      print('error here lllllkk');
      emit(searchError(error.toString()) );
    }
    );
  }

}

