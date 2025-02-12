import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseFireStoreService {

  ///[Function] to get collection reference
  static CollectionReference<EventDataModel> getCollectionReference() {
    return FirebaseFirestore.instance.collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
        fromFirestore: (snapshot,_) => EventDataModel.fromFirestore(snapshot.data()!),
        toFirestore: (data,_) => data.toFireStore()
    );
  }

  static Future<bool> createNewEvent(EventDataModel data) async {
    try{
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc();
      data.eventId = docRef.id;
      docRef.set(data);
      return Future.value(true);
    }catch(e){
      return Future.value(false);
    }
  }

  // static Future<List<EventDataModel>> getDataFromFireStore() async{
  //   var collectionRef = getCollectionReference();
  //   QuerySnapshot<EventDataModel> data  = await collectionRef.get();
  //   List<EventDataModel> eventDataList = data.docs.map((element){
  //     return element.data();
  //   }).toList();
  //   return eventDataList;
  // }

  static Stream<QuerySnapshot<EventDataModel>> getStreamDataFromFireStore(String eventCategory){
    var collectionRef = getCollectionReference().where("eventCategory",isEqualTo: eventCategory)
    .where("userId" ,isEqualTo: FirebaseAuth.instance.currentUser?.uid);
    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamFavoriteDataFromFireStore(){
    var collectionRef = getCollectionReference().where("isFavorite",isEqualTo: true)
        .where("userId" ,isEqualTo: FirebaseAuth.instance.currentUser?.uid);
    return collectionRef.snapshots();
  }

  static Future<void> updateEvent(EventDataModel eventData) async {
    var collectionRef = getCollectionReference();
    var docRef = collectionRef.doc(eventData.eventId);
    return docRef.update(eventData.toFireStore());
  }


  static deleteEvent(EventDataModel eventData) async{
    var collectionRef = getCollectionReference();
    var docRef = await collectionRef.doc(eventData.eventId);
    return docRef.delete();
  }

}