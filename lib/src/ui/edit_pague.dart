import 'package:crud3/src/bloc/user_bloc.dart';
import 'package:crud3/src/resources/bloc_provider.dart';
import 'package:crud3/src/ui/user_pague.dart';
import 'package:flutter/material.dart';
class EditPague extends StatefulWidget {
  final String rut;
  final String nombre;

EditPague({
  this.rut,
  this.nombre

});
  @override
  _EditPagueState createState() => _EditPagueState(

    nombre:nombre,
    rut:rut
  );
}

class _EditPagueState extends State<EditPague> {
String _nombreTr;
  final String rut;
  final String nombre; 
 UserBloc bloc;

 _EditPagueState({

   this.rut,
  this.nombre

 });
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
                                  
                                      bloc.update(_nombreTr, rut);
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
        labelText: nombre,
        helperText: "solo nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        _nombreTr=valor;
      },
    );
  }

    Widget _crearInputRut() {

  return Text("el rut de la persona es "+rut);
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