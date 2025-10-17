import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/firebase/add_event_moder.dart';
import 'package:eventlyapp/firebase/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseUtils {
  static CollectionReference<EventModel> getEvent(String uid) {
    return getUsersCollection()
        .doc(uid)
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data()!),
          toFirestore: (event, options) => event.toJson(),
        );
  }

  static Future<void> addEventToFireStore(EventModel eventModel, String uid) {
    CollectionReference<EventModel> collectionRef = getEvent(uid);
    DocumentReference<EventModel> docRef = collectionRef.doc();
    eventModel.id = docRef.id;
    return docRef.set(eventModel);
  }

  static Future<void> updateEventFav(String eventId, bool isFav, String uid) {
    if (eventId.isEmpty) {
      return Future.error('Event id is empty');
    }
    return getEvent(uid).doc(eventId).update({'if_fav': isFav});
  }

  static Future<void> updateEvent(EventModel event, String uid) {
    if (event.id.isEmpty) {
      return Future.error('Event id is empty');
    }
    return getEvent(uid).doc(event.id).set(event);
  }

  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> AddUserToFireStore(MyUser myuser) {
    return getUsersCollection().doc(myuser.id).set(myuser);
  }

  static Future<MyUser?> readUserFromFireStore(String id) async {
    var query = await getUsersCollection().doc(id).get();
    return query.data();
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.message}");
      return null;
    } catch (e) {
      print("Error in Google Sign-In: $e");
      return null;
    }
  }
}