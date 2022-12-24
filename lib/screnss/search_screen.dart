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