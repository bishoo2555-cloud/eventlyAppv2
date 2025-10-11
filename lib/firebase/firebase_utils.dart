import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/firebase/add_event_moder.dart';

class FireBaseUtils {
  static CollectionReference<EventModel> getEvent() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data()!),
          toFirestore: (event, options) => event.toJson(),
        );
  }

  static Future<void> addEventToFireStore(EventModel eventModel) {
    CollectionReference<EventModel> collectionRef = getEvent();
    DocumentReference<EventModel> docRef = collectionRef.doc();
    eventModel.id = docRef.id;
    return docRef.set(eventModel);
  }
}
