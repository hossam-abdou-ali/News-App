import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/state.dart';

import '../cubit/Cubit_screen.dart';
import '../component.dart';
class sc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) { return Newscubit.get(context)..ScienceBut(); },
      child: BlocConsumer<Newscubit, Newsstate>(
          listener: (context, state) {},
          builder: (context, state) {
            var list = Newscubit.get(context);

            return ConditionalBuilder(
              condition: state is! GetScienceLoading,
              builder: (context) => ListView.separated(

                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    BottomItems(list.scienceModel, index,context),
                separatorBuilder: (context, index) => SizedBox(height: 2.0),
                itemCount:list.scienceModel!.articles!.length,
              ),
              fallback: (context) =>Center(child: CircularProgressIndicator()),
            );          }
      ),
    );
    // BlocProvider(
    //   create: (BuildContext context)
    //   {
    //     return Newscubit.get(context)..scienceBut();
    //     },
    //   child: BlocConsumer<Newscubit, Newsstate>(
    //       listener: (context, state) {},
    //       builder: (context, state) {
    //         var list = Newscubit.get(context).science;
    //
    //
    //         return ConditionalBuilder(
    //           condition: state is! GetScienceLoading,
    //           builder: (context) => ListView.separated(
    //             shrinkWrap: true,
    //             physics: BouncingScrollPhysics(),
    //             itemBuilder: (context, index) {
    //               return BottomItems(Newscubit.get(context).articleModel, index);
    //             },
    //             separatorBuilder: (context, index) => SizedBox(height: 2.0),
    //             itemCount: Newscubit.get(context).articleModel!.articles!.length,
    //           ),
    //           fallback: (context) =>Center(child: CircularProgressIndicator()
    //           ),
    //         );
    //       }
    //   ),
    // );
  }
}
