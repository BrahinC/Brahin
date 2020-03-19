
import 'package:crud3/src/model/oferta.dart';


import 'package:crud3/src/resources/bloc_provider.dart';
import 'package:crud3/src/resources/firebase_repository.dart';
import 'package:rxdart/subjects.dart';


class OfertaBloc extends BlocBase{
  
FirebaseRepository _repository;


//Lita de oferta 

List<Oferta> _auxOfertaJ = new List<Oferta>();
List<Oferta> _auxOfertaL = new List<Oferta>();
List<Oferta> _auxOfertaU = new List<Oferta>();

//stremcontroler 

BehaviorSubject<List<Oferta>> _ofertaController=BehaviorSubject<List<Oferta>>();
//in >> skin 
Sink<List<Oferta>> get _inOferta=>_ofertaController.sink;

//out >>>>> stream 

Stream <List<Oferta>> get outOferta=> _ofertaController.stream;



OfertaBloc(){


_auxOfertaL.clear();
_auxOfertaU.clear();
_auxOfertaJ.clear();
  _repository=FirebaseRepository();
  
  _repository.getOfertasJumbo().listen((snapshotOferta){

    
    snapshotOferta.documents.forEach((sn){
      Oferta o=Oferta.fromSnapshot(sn);
      _auxOfertaJ.add(o);

    });
    
_inOferta.add(_auxOfertaJ);

  _repository.getOFertasLider().listen((snapshotOferta){
_auxOfertaL.clear();
    snapshotOferta.documents.forEach((sn){
      Oferta o=Oferta.fromSnapshot(sn);
      _auxOfertaL.add(o);

    });
    


        _inOferta.add(_auxOfertaJ+_auxOfertaL);
  
  
  });
  
        
   _repository.getOfertasUnimarc().listen((snapshotOferta){
_auxOfertaU.clear();
    snapshotOferta.documents.forEach((sn){
      Oferta o=Oferta.fromSnapshot(sn);
      _auxOfertaU.add(o);

    });
    


        _inOferta.add(_auxOfertaJ+_auxOfertaL+_auxOfertaU);
  
  
  });
   
  
  });


}




 
  @override
  void dispose() {
    
    _inOferta.close();
    _ofertaController.close();
   _auxOfertaL.clear();
    _auxOfertaJ.clear(); 
    _auxOfertaU.clear()   ;
    
  }


}
