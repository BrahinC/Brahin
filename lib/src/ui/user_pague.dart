
import 'package:crud3/src/bloc/user_bloc.dart';
import 'package:crud3/src/model/usuraio.dart';
import 'package:crud3/src/resources/bloc_provider.dart';
import 'package:crud3/src/ui/registro_page.dart';
import 'package:flutter/material.dart';

import 'edit_pague.dart';

class UserPage extends StatelessWidget {
 
 UserBloc bloc;
 
  
  @override
  Widget build(BuildContext context) {
    bloc=BlocProvider.of<UserBloc>(context);
  
    return Scaffold(
      appBar: AppBar(
         title: Text(
           "Inicio "
         )
      ),
      body: StreamBuilder<List<Usuario>>(
        stream: bloc.outUsario,
        builder:(BuildContext ctx,  AsyncSnapshot<List<Usuario>> sn ){
          

          if(sn.hasData){
             return ListView(
               children: sn.data.map((Usuario u){
               
                 return Column(
                   children: <Widget>[
                          Text(u.nombre,
                         style:TextStyle(
                           fontSize: 20
                         ),),
                         Text(u.rut,
                         style:TextStyle(
                           fontSize: 20
                         ),),
                        Center(
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text("editar"),
                                  
                                  onPressed: (){
                                                       Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){

           return BlocProvider<UserBloc>(
        child:EditPague(
nombre: u.nombre,
rut: u.rut,
        ) , 
        bloc: UserBloc());
    
        }
      )
    );
       
                                  }),
                                  RaisedButton(
                                  child: Text("borrar"),
                                  
                                  onPressed:(){
                                    bloc.eliminarUser(u.rut);
                                  })
                              ],
                            )
                          ),
                        ),
                        Divider(),
                      
                        

                   
                   ],
                 );
               }).toList()
             );
          }
          return Text("error");

        }
        

      


      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
                     Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){

           return BlocProvider<UserBloc>(
        child:RegistroPage() , 
        bloc: UserBloc());
    
        }
      )
    );
            
        },
      ),

    );
  }
}