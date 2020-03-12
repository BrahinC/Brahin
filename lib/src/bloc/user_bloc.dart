
import 'package:crud3/src/model/usuraio.dart';
import 'package:crud3/src/resources/bloc_provider.dart';
import 'package:crud3/src/resources/firebase_repository.dart';
import 'package:rxdart/subjects.dart';


class UserBloc extends BlocBase{
  
FirebaseRepository _repository;

//lista de usuarios

List<Usuario> _auxUsuario =new List<Usuario>();

//stremcontroler 
  BehaviorSubject<List<Usuario>> _usuarioController=BehaviorSubject<List<Usuario>>();
//in >>>> sink 
Sink<List<Usuario>> get _inUsuario=> _usuarioController.sink;

//out >>>> stream

Stream <List<Usuario>> get outUsario => _usuarioController.stream;


//crear ususrio 
 void createUser(String  n, String r) async {
   _repository.createUser( n,  r);
  }
  
  //elimianr user 
     eliminarUser(String jobId){
    _repository.eliminarUser(jobId);
  }
  void update (String  n, String r) async {  
 
  _repository.update(n, r);
}

UserBloc(){
  _repository=FirebaseRepository();
  _repository.getUsuario().listen((snapshotUser){
    _auxUsuario.clear();
    
    snapshotUser.documents.forEach((snapshot){
      Usuario u=Usuario.fromSnapshot(snapshot);
      _auxUsuario.add(u);

    });

    _inUsuario.add(_auxUsuario);

  });
}

  
  
  @override
  void dispose() {
    _inUsuario.close();
    _usuarioController.close();
    
  }


}
