import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_a/modules/business_page/business_page.dart';
import 'package:news_app_a/modules/science_page/science_page.dart';
import 'package:news_app_a/modules/sports_page/sports-page.dart';
import 'package:news_app_a/shared/cubit/state.dart';
import 'package:news_app_a/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsAppInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String>titles = [
    'Business News',
    'Science News',
    'Sports News',
  ];
  List<Widget>screen = [
    BusinessPage(),
    SciencePage(),
    SportsPage(),
  ];
  List<BottomNavigationBarItem> navBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business,),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science,),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports,),
      label: 'Sports',
    ),
  ];
  void selectBottomNavigationBarItem(index){
    currentIndex = index;
    emit(NewsAppSelectBottomNavigationBarItemState());
  }

  bool isDark = false;
  void selectThemeMode () {
    isDark = !isDark;
    emit(NewsAppSelectThemeModeState());
  }

  // https://newsapi.org/
  // v2/top-headlines?
  // country=eg&
  // category=business&
  // apiKey=65f7f556ec76449fa7dc7c0069f040ca
  List businessNews = [];
  void getBusinessNews () {
    emit(AppGetNewsBusinessLoadingState());
    if (businessNews.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : '133f1a048ba1495a9ddd41ac7642e020',
        },
      ).then((value) {
        businessNews = value.data['articles'];
        emit(AppGetNewsBusinessSuccessState());
      }).catchError((e){
        print('This is error ${e.toString()}');
        emit(AppGetNewsBusinessErrorState());
      });
    } else {
      emit(AppGetNewsBusinessSuccessState());
    }
  }
  List scienceNews = [];
  void getScienceNews () {
    emit(AppGetNewsScienceLoadingState());
    if (scienceNews.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : '133f1a048ba1495a9ddd41ac7642e020',
        },
      ).then((value) {
        scienceNews = value.data['articles'];
        emit(AppGetNewsScienceSuccessState());
      }).catchError((e){
        print('This is error ${e.toString()}');
        emit(AppGetNewsScienceErrorState());
      });
    } else {
      emit(AppGetNewsScienceSuccessState());
    }
  }
  List sportsNews = [];
  void getSportsNews () {
    emit(AppGetNewsSportsLoadingState());
    if (sportsNews.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : '133f1a048ba1495a9ddd41ac7642e020',
        },
      ).then((value) {
        sportsNews = value.data['articles'];
        emit(AppGetNewsSportsSuccessState());
      }).catchError((e){
        print('This is error ${e.toString()}');
        emit(AppGetNewsSportsErrorState());
      });
    } else {
      emit(AppGetNewsSportsSuccessState());
    }
  }


  // https://newsapi.org/
  // v2/everything
  // q=bitcoin
  // apiKey=133f1a048ba1495a9ddd41ac7642e020

  List<dynamic>searchNews = [];
  void getNewsSearch (value) {
    emit(AppGetNewsSearchLoadingState());
    searchNews = [];
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey' : '133f1a048ba1495a9ddd41ac7642e020',
      },
    ).then((value) {
      searchNews = value.data['articles'];
      emit(AppGetNewsSearchSuccessState());
    }).catchError((error){
      print('this is error ${error.toString()}');
      emit(AppGetNewsSearchErrorState());
    });
  }
}