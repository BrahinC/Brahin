import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud3/src/model/usuraio.dart';

class FirebaseProvider{

Firestore _firestore;

FirebaseProvider(){
  _firestore=Firestore.instance;
}

Stream<QuerySnapshot> getUsuario(){
  return _firestore.collection("/usuarios").snapshots();
}

void createUser (String  n, String r) async { await 
  _firestore.collection ( "/usuarios" ) 
      .document ( r ) 
      .setData ({ 
        'nombre' : n, 
      
       }); 

  

 

}
   Future<void> eliminarUser(String jobId){
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

