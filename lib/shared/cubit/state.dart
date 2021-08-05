abstract class NewsState {}

class NewsAppInitialState extends NewsState {}

class NewsAppSelectBottomNavigationBarItemState extends NewsState {}

class NewsAppSelectThemeModeState extends NewsState {}

class AppGetNewsBusinessLoadingState extends NewsState {}
class AppGetNewsBusinessSuccessState extends NewsState {}
class AppGetNewsBusinessErrorState extends NewsState {}

class AppGetNewsScienceLoadingState extends NewsState {}
class AppGetNewsScienceSuccessState extends NewsState {}
class AppGetNewsScienceErrorState extends NewsState {}

class AppGetNewsSportsLoadingState extends NewsState {}
class AppGetNewsSportsSuccessState extends NewsState {}
class AppGetNewsSportsErrorState extends NewsState {}

class AppGetNewsSearchLoadingState extends NewsState {}
class AppGetNewsSearchSuccessState extends NewsState {}
class AppGetNewsSearchErrorState extends NewsState {}