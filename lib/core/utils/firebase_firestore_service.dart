import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_data_model.dart';

abstract class FirebaseFireStoreService{

  static collectionRef<EventDataModel>(){

  }

  static createNewEvent(EventDataModel data)async{
    var collectionRef = FirebaseFirestore.instance.collection(EventDataModel.collectionName);
     collectionRef.();
    var docRef = collectionRef.doc();
    docRef.set(data);
    return Future.value(true)
  }
  static getDataFromFireStore(){
    var collectionRef = FirebaseFirestore.instance.collection();

}
static deleteEvent(){

}
}