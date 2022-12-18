// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled2/cubit/state.dart';
//
// import '../component.dart';
// import '../cubit/Cubit_screen.dart';
//
// class SearchScreen extends StatelessWidget {
//   var searchcontroller =TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<Newscubit,Newsstate>(
//           listener: ( context,  state) {},
//           builder: ( context, state)
//           {
//             return Scaffold(
//               appBar: AppBar(),
//               body: Column(
//                 children: [
//                   Padding
//                     (
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField
//                       (
//                       controller: searchcontroller,
//                       keyboardType: TextInputType.text,
//                       onFieldSubmitted: (value){print(value);},
//                       onChanged: (value)
//                       {Newscubit.get(context).searchbut(value);},
//                       validator: (value){  if(value!.isEmpty)
//                       {return'it can\'t be empty';}
//                       return null;  },
//                       decoration: InputDecoration
//                         (
//                         labelText: 'Search',
//                         prefixIcon: Icon(Icons.search_rounded),
//                       ),
//                     ),),
//                   ConditionalBuilder(
//                     condition: true,
//                     builder: (context) => ListView.separated(
//
//                         physics: BouncingScrollPhysics(),
//                         itemBuilder: (context, index) =>BottomItems(Newscubit.get(context).searchmodel, index,context),
//                         separatorBuilder: (context, index) => SizedBox(height: 2.0),
//                         itemCount:Newscubit.get(context).searchmodel!.articles!.length),
//                     fallback: (context) => Center(child: CircularProgressIndicator()),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//     );
//   }
// }
