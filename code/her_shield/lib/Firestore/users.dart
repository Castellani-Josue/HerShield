import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createUserWithCustomId(String customUserId, String email) async {
  try {
    // Créer une référence à la collection "users" avec l'ID personnalisé
    DocumentReference userReference =
    FirebaseFirestore.instance.collection('users').doc(customUserId);


    DocumentSnapshot snapshot = await userReference.get();
    if (snapshot.exists) {
      //print('Un utilisateur avec lID $customUserId existe déjà');
    } else
    {
      // Ajouter un nouvel utilisateur avec l'ID personnalisé
      await userReference.set({
        'customUserId': customUserId,
        'email': email,

      });

      //print('Utilisateur créé avec succès avec lID personnalisé: $customUserId');
    }
  } catch (e) {
    //print('Erreur lors de la création de lutilisateur : $e');
  }
}

//mthd call before the add of fields customID and email
