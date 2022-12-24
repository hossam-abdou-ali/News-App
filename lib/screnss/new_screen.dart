import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/state.dart';
import 'package:untitled2/screnss/search_screen.dart';
import '../core/comp.dart';
import '../cubit/Cubit_screen.dart';
import 'business_screen.dart';



class news extends StatefulWidget {

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (BuildContext context) => Newscubit()..businessBut()..ScienceBut()..SportBut(),

      child: BlocConsumer<Newscubit,Newsstate>(
        listener: (context,state){},
        builder: (context,state)
        {
          var c = Newscubit.get(context);
          List<Widget> screens = [
            bus(model: c.articleModel),
            bus(model: c.sportModel),
            bus(model: c.scienceModel)
          ];


          return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                actions: [
                  IconButton(onPressed:()
                  {
                    Navigateto(context,SearchScreen());

                  },

                      icon: (Icon(Icons.search,color: Colors.black,))
                  ),

                  IconButton(onPressed:()
                  {
                    setState(() {
                      modecubit.get(context).mode();
                    });
                    } ,
                      icon: (Icon(Icons.brightness_4,color: Colors.black,))
                  ),
                ],


              ),

              body: screens[c.currentIndex],


              bottomNavigationBar: BottomNavigationBar(
                currentIndex:c.currentIndex,
                items:c.bottomItems,
                onTap:(index) {
                  setState(() {
                    c.currentIndex=index;
                  });
                  },
              )



          );
        },


      ),
    );
  }
}
