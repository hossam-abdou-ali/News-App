import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/state.dart';
import '../cubit/Cubit_screen.dart';
import '../component.dart';
class sp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     return  BlocProvider(
       create: (BuildContext context)
       {
         return Newscubit.get(context)..SportBut();
         },
       child: BlocConsumer<Newscubit, Newsstate>(
           listener: (context, state) {},
           builder: (context, state) {
             var list = Newscubit.get(context);

             return ConditionalBuilder(
               condition: true,
               builder: (context) => ListView.separated(

                 physics: BouncingScrollPhysics(),
                 itemBuilder: (context, index) =>
                     BottomItems(list.sportModel, index,context),
                 separatorBuilder: (context, index) => SizedBox(height: 2.0),
                 itemCount: list.sportModel!.articles!.length,
               ),
               fallback: (context) =>Center(child: CircularProgressIndicator()
               ),
             );
           }
       ),
     ); }
}
