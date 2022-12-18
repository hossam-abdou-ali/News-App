import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/Cubit_screen.dart';
import 'package:untitled2/cubit/state.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.model, required this.index}) : super(key: key);

  final model;
  final int index;

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<Newscubit,Newsstate>(

        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state)
        {
          return  Scaffold(

            appBar: AppBar(),
            body: SingleChildScrollView(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.teal,

                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: NetworkImage(model.articles![index].urlToImage.toString()),
                          fit: BoxFit.cover
                      ),
                    )
                ),
                const SizedBox(height: 20,),
                Text(model.articles![index].title.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color: Colors.teal), maxLines: 10,)
              ],
            ),
            ),
          );
        }

        );
  }
}
