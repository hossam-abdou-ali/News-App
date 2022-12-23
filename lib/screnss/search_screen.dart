/*
import 'dart:collection';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/state.dart';
import 'package:untitled2/screns_models/search_model.dart';

import '../component.dart';
import '../cubit/Cubit_screen.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchcontroller =TextEditingController();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) {
        return Newscubit()..searchbut(searchcontroller.text.isEmpty ? 'hh' : searchcontroller.text);
      },
      child: BlocConsumer<Newscubit,Newsstate>(
            listener: ( context,  state) {},
            builder: ( context, state)
            {
              var cubit = Newscubit.get(context);
              return Scaffold(
                appBar: AppBar(),
                body: Column(
                  children: [
                    Padding
                      (
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField
                        (
                        controller: searchcontroller,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value){print(value);},
                        onChanged: (value)
                        {cubit.searchbut(value);},
                        validator: (value){  if(value!.isEmpty)
                        {return'it can\'t be empty';}
                        return null;  },
                        decoration: InputDecoration
                          (
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search_rounded),
                        ),
                      ),),
                    ConditionalBuilder(
                      condition: true,
                      builder: (context) => Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => */
/*StreamBuilder<UnmodifiableListView<Searchmodel>>(
                                stream: cubit.search,
                                initialData: UnmodifiableListView<Searchmodel>([]),
                                builder: (context, snapshot) {
                                  return *//*
 Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: cubit.searchmodel!.articles!.where((element) =>
                                          searchcontroller.text.isNotEmpty ? element.title == int.tryParse(searchcontroller.text) : ''==''
                                      ).map((e) =>

                                      ).toList(),
                                        Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              image: cubit.searchmodel!.articles![index].urlToImage != null ? DecorationImage(
                                                  image: NetworkImage(cubit.searchmodel!.articles![index].urlToImage.toString()),
                                                  fit: BoxFit.cover) : const DecorationImage(
                                                  image: AssetImage("assets/images/simpson.png"), fit: BoxFit.cover),
                                            )
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: Text(cubit.searchmodel!.articles![index].title.toString(),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: 15.0),
                                                    )),
                                                Text(cubit.searchmodel!.articles![index].publishedAt.toString(),
                                                  style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                 */
/* );
                                }*//*
),
                            separatorBuilder: (context, index) => SizedBox(height: 2.0),
                            itemCount:cubit.searchmodel!.articles!.length),
                      ),
                      fallback: (context) => Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              );
            }

      ),
    );
  }
}
// نجمع كلهم ف ليست
// نسيرش بحاجه معينه اسم تايتل id هكذا
*/






import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/Cubit_screen.dart';
import 'package:untitled2/cubit/state.dart';

import '../core/comp.dart';

class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<Newscubit, Newsstate>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = Newscubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value)
                  {
                    Newscubit.get(context).getSearch(value);
                  },
                  validate: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },
    );
  }
}