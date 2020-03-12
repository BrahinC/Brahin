import 'package:crud3/src/bloc/user_bloc.dart';

import 'package:crud3/src/resources/bloc_provider.dart';
import 'package:crud3/src/ui/user_pague.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

  String _nombre;
  String _rut;

 UserBloc bloc;
  @override
  Widget build(BuildContext context) {
     bloc=BlocProvider.of<UserBloc>(context);
    return Container(
       child: Scaffold(
        appBar: AppBar(
          title: Text("Registrar "),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2 ),
          children: <Widget>[
            _crearInput(),
             _crearInputRut(),
             Center(
               child: RaisedButton(
                                  child: Text("guardar"),
                                  
                                  onPressed: (){
                                  
                                      bloc.createUser(_nombre, _rut);
                                  _home(context);
                                  })
             )
          ],
        ),
       )
    );
  }

  Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(20.0)
         ),
        hintText: "nombre ",
        labelText: "nombre",
        helperText: "solo nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        _nombre=valor;
      },
    );
  }

    Widget _crearInputRut() {

    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(20.0)
         ),
        hintText: "rut ",
        labelText: "rut",
        helperText: "solo rut",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        _rut=valor;
      },
    );
  }

  void _home(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){

           
           return BlocProvider<UserBloc>(
        child:UserPage()  , 
        bloc: UserBloc());
    
        }
      )
    );
  }
}