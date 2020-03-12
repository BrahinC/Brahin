import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String rut;
  String nombre;

  Usuario.name({
    this.rut,this.nombre
  });

  Usuario.fromSnapshot(DocumentSnapshot snapshot):
  rut=snapshot.documentID,
  nombre=snapshot.data["nombre"];
}