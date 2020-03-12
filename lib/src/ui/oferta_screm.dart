
import 'package:crud3/src/bloc/oferta_bloc.dart';
import 'package:crud3/src/bloc/user_bloc.dart';
import 'package:crud3/src/model/oferta.dart';
import 'package:crud3/src/resources/bloc_provider.dart';
import 'package:crud3/src/ui/user_pague.dart';
import 'package:flutter/material.dart';
class OfertaScrem extends StatelessWidget {
  OfertaBloc bloc;
 

  @override
  Widget build(BuildContext context) {
      bloc=BlocProvider.of<OfertaBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("oferta"),
      
      ),
      body:StreamBuilder<List<Oferta>>(

        stream: bloc.outOferta,
         builder:(BuildContext ctx,  AsyncSnapshot<List<Oferta>> sn ){
           

          
            if(sn.hasData){
              return ListView(
                children: sn.data.map((Oferta o){
                  if(o!=null){
                    return Column(
                    children: <Widget>[
                      Text(o.nombre),
                      Text(o.tienda),
                      Text(o.precio)
                    ],
                    
                  );
                    
                  }else{
                    return Text("cargando");
                  }
                  

                }).toList()

              );

            }
         
         
          

            return Text("error");
         
         }
         
    
      ),
      bottomNavigationBar: appBar(context),
    );
  }
}

Widget appBar(BuildContext context) {
return BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          botonAction(Icons.shopping_cart, context),
          botonAction(Icons.map, context),
          SizedBox(
            height: 48.0,
          ),
          botonAction(Icons.exit_to_app, context),
          botonAction(Icons.settings, context),
        ],
      ),
    );

}

botonAction(IconData icon, BuildContext context) {
   return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.5),
        child: Icon(icon),
      ),
      onTap: () {
        if (icon == Icons.home) {
          MaterialPageRoute(
        builder: (BuildContext context){

           return BlocProvider<UserBloc>(
        child:UserPage(), 
        bloc: UserBloc()
        );
    
        }
      );
         
        }

        if (icon == Icons.shopping_cart) {
                                                               Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){

           return BlocProvider<OfertaBloc>(
        child: OfertaScrem(), 
        bloc: OfertaBloc()
        );
    
        }
      )
    );
          
        }
      },
    );
}