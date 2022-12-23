import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/screns_models/search_model.dart';
import 'package:untitled2/screns_models/business_model.dart';
import 'package:untitled2/cubit/state.dart';
import '../screns_models/science_model.dart';
import '../screns_models/sport_model.dart';
import '../Dio.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:core';
import 'dart:async';
import 'dart:collection';

class Newscubit extends Cubit<Newsstate> {
  Newscubit() :super(Newsintial());

  static Newscubit get(context) => BlocProvider.of(context);

  int currentIndex =0;


  List <BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business,),label:'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label:'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label:'Science'),
  ];


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

/*

  final _searchmodel = BehaviorSubject<UnmodifiableListView<Searchmodel>>();

  Stream<UnmodifiableListView<Searchmodel>> get search => _searchmodel.stream;
*/

  List<dynamic> search = [];

  Future<void> getSearch(String value) async{
    emit(searchloading());

    await Diohelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(searchSuc());
    }).catchError((error){
      print(error.toString());
      emit(searchError(error.toString()));
    });
  }
  Searchmodel? searchmodel;
  Future<void> searchbut(value) async {
    emit(searchloading());
    await Diohelper.getData(
        url:'v2/everything',
        query:{
          'q': value,
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }
    ).then((value) {
      searchmodel = Searchmodel.fromJson(value.data);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data}');

      print('Search yet');
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