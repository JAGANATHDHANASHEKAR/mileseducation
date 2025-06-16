import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mileseducation/common/configuration/enum.dart';
import 'package:mileseducation/view/home_screen/model/add_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final homePageStatus = ChangeNotifierProvider((ref) => HomePageProvider());

class HomePageProvider extends ChangeNotifier {
  Status homePageStatus = Status.loading;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Note> notes = [];

  String get userEmail => _auth.currentUser?.email ?? "guest@example.com";
  Future<void> fetchNotes() async {
    try {
      homePageStatus = Status.loading;
      notifyListeners();
      final snapshot = await _firestore
          .collection('users')
          .doc(userEmail)
          .collection('notes')
          .get();
      notes = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // include ID in model
        return Note.fromJson(data);
      }).toList();
      homePageStatus = Status.successful;
    } catch (e) {
      homePageStatus = Status.error;
    }
    notifyListeners();
  }

  Future<void> addNote(String dateTime, String description) async {
    final doc = _firestore
        .collection('users')
        .doc(userEmail)
        .collection('notes')
        .doc();
    final note = Note(id: doc.id, dateTime: dateTime, description: description);
    await doc.set(note.toJson());
    await fetchNotes();
  }

  Future<void> updateNote(
    String id,
    String datetime,
    String description,
  ) async {
    final doc = _firestore
        .collection('users')
        .doc(userEmail)
        .collection('notes')
        .doc(id);
    await doc.update({'datetime': datetime, 'description': description});
    await fetchNotes();
  }

  Future<void> deleteNote(String id) async {
    final doc = _firestore
        .collection('users')
        .doc(userEmail)
        .collection('notes')
        .doc(id);
    await doc.delete();
    await fetchNotes();
  }
}
