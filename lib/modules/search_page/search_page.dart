import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_a/shared/components/components.dart';
import 'package:news_app_a/shared/cubit/cubit.dart';
import 'package:news_app_a/shared/cubit/state.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).searchNews;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search For News'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if (value!.isEmpty){
                      return 'this filed must be not null';
                    }
                    return null;
                  },
                  onChanged: (value){
                    NewsCubit.get(context).getNewsSearch(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              list.length> 0? Expanded(child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>  articleBuilder(list[index], context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: list.length,
              )) : Expanded(child: Center(child: Container())),
            ],
          ),
        );
      },
    );
  }
}
