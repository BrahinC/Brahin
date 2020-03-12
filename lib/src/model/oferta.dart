import 'package:cloud_firestore/cloud_firestore.dart';

class Oferta {
  String precio;
  String nombre;
  String id;
  String tienda;

  Oferta.name({
    this.precio,this.nombre,this.id,this.tienda
  });

  Oferta.fromSnapshot(DocumentSnapshot snapshot):
  id=snapshot.documentID,
  nombre=snapshot.data["nombre"],
  precio=snapshot.data["precio"],
  tienda=snapshot.data["tienda"];
}