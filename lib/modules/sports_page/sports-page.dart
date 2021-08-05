import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_a/shared/components/components.dart';
import 'package:news_app_a/shared/cubit/cubit.dart';
import 'package:news_app_a/shared/cubit/state.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).sportsNews;
        return list.length> 0? ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>  articleBuilder(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length,
        ) : Center(child: CircularProgressIndicator());
      },
    );
  }
}
