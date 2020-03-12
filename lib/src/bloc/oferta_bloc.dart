
import 'package:crud3/src/model/oferta.dart';

import 'package:crud3/src/resources/bloc_provider.dart';
import 'package:crud3/src/resources/firebase_repository.dart';
import 'package:rxdart/subjects.dart';


class OfertaBloc extends BlocBase{
  
FirebaseRepository _repository;

//lista de Oferta

List<Oferta> _auxOfertaj=new List<Oferta>();
List<Oferta> _auxOfertal =new List<Oferta>();
List<Oferta> _auxOfertau =new List<Oferta>();

//stremcontroler 
  BehaviorSubject<List<Oferta>> _usuarioOferta=BehaviorSubject<List<Oferta>>();
//in >>>> sink 
Sink<List<Oferta>> get _inOferta=> _usuarioOferta.sink;

//out >>>> stream

Stream <List<Oferta>> get outOferta => _usuarioOferta.stream;




 OfertaBloc(){
  _repository=FirebaseRepository();
   _auxOfertaj.clear();
    
  //get jumbo
  _repository.getOfertasJumbo().listen((snapsOferta){
   

    
    snapsOferta.documents.forEach((snapshot){
      Oferta o=Oferta.fromSnapshot(snapshot);
      _auxOfertaj.add(o);

    });

    

  

  });
  
  //get lider
   _repository.getOFertasLider().listen((snapsOferta){
     

    
    snapsOferta.documents.forEach((snapshot){
      Oferta o=Oferta.fromSnapshot(snapshot);
      _auxOfertaj.add(o);

    });

    

    

  });
  //get unimarc
   _repository.getOfertasUnimarc().listen((snapsOferta){
 
    
    snapsOferta.documents.forEach((snapshot){
      Oferta o=Oferta.fromSnapshot(snapshot);
      _auxOfertaj.add(o);

    });

    

  

  });

  
  
  _inOferta.add(_auxOfertaj);
  /*
  _inOferta.add(_auxOfertal);
   _inOferta.add(_auxOfertau);
   
   */
}

  
  
  @override
  void dispose() {
    _inOferta.close();
    _usuarioOferta.close();
    
  }


}
