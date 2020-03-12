import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseProvider{

Firestore _firestore;

FirebaseProvider(){
  _firestore=Firestore.instance;
}

//tre a todos los usuarios 
Stream<QuerySnapshot> getUsuario(){
  return _firestore.collection("/usuarios").snapshots();
}

//trae todas las ofertas del lider , jumbo y unimarc 
Stream<QuerySnapshot> getOFertasLider(){
  return _firestore.collection("/ofertas_lider").snapshots();
}

Stream<QuerySnapshot> getOfertasJumbo(){
  return _firestore.collection("/oferta_jumbo").snapshots();
}

Stream<QuerySnapshot> getOfertasUnimarc(){
  return _firestore.collection("/ofertas_unimarc").snapshots();
}



void createUser (String  n, String r) async { await 
  _firestore.collection ( "/usuarios" ) 
      .document ( r ) 
      .setData ({ 
        'nombre' : n, 
      
       }); 

  

 

}
   eliminarUser(String jobId){
     _firestore.collection('/usuarios').document(jobId).delete();
  }

  

void update (String  n, String r) async { await 
  _firestore.collection ( "/usuarios" ) 
      .document ( r ) 
      .updateData({ 
        'nombre' : n, 
      
       }); 

  

 

}
      
      
}

