import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud3/src/model/usuraio.dart';
import 'package:crud3/src/resources/firebase_provider.dart';


class FirebaseRepository{
 final _provider=FirebaseProvider();


  Stream<QuerySnapshot> getUsuario()=>_provider.getUsuario();
 
  void createUser(String  n, String r) async {
    _provider.createUser( n,  r);
  }
     Future<void> eliminarUser(String jobId){
    _provider.eliminarUser(jobId);

  }

  void update (String  n, String r) async { await 
  _provider.update(n, r);

  

 

}
}