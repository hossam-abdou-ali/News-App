



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/component.dart';
import 'package:untitled2/cubit/state.dart';

import '../core/comp.dart';
import '../cubit/Cubit_screen.dart';
import 'details_screen.dart';

class bus extends StatelessWidget {
const bus({Key? key, required this.model});

final model ;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)
      {
        return Newscubit()..businessBut();
        },
      child: BlocConsumer<Newscubit, Newsstate>(
          listener: (context, state) {},
          builder: (context, state) {

            var list = Newscubit.get(context);

            return ConditionalBuilder(
              condition: state is! GetBusinessLoading,
              builder: (context) => ListView.separated(

                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
               InkWell(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(
                           builder: (context) => DetailsScreen(model: model, index: index,)
                     ),
                     );
                   },
                   child: BottomItems(model, index,context)),
                separatorBuilder: (context, index) => SizedBox(height: 2.0),
                itemCount: model.articles!.length,
              ),
              fallback: (context) =>Center(child: CircularProgressIndicator()
              ),
            );
          }
      ),
    );
  }
}