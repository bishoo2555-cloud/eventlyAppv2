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

  static Future<void> updateEventFav(String eventId, bool isFav) {
    if (eventId.isEmpty) {
      return Future.error('Event id is empty');
    }
    return getEvent().doc(eventId).update({'if_fav': isFav});
  }

  static Future<void> updateEvent(EventModel event) {
    if (event.id.isEmpty) {
      return Future.error('Event id is empty');
    }
    return getEvent().doc(event.id).set(event);
  }
}
