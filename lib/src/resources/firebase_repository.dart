import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:crud3/src/resources/firebase_provider.dart';


class FirebaseRepository{
 final _provider=FirebaseProvider();


  //se conecta con la funcion del firebase provider para traer todos los usuarios 
  Stream<QuerySnapshot> getUsuario()=>_provider.getUsuario();


 //se conecta con el provider para tarer todas las ofertas de jumbo , lider , unimarc 
  Stream<QuerySnapshot> getOFertasLider()=>_provider.getOFertasLider();

  Stream<QuerySnapshot> getOfertasJumbo()=>_provider.getOfertasJumbo();

  Stream<QuerySnapshot> getOfertasUnimarc()=>_provider.getOfertasUnimarc();


 
  void createUser(String  n, String r) async {
    _provider.createUser( n,  r);
  }
    eliminarUser(String jobId){
    _provider.eliminarUser(jobId);

  }

  void update (String  n, String r) async { await 
  _provider.update(n, r);

  

 

}
}