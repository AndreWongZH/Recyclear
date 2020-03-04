import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

String name;
String imageUrl;
int token;
String uid;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final Firestore _db = Firestore.instance;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  _db.collection("users").document(user.uid)
      .get().then((value) {
    if (value.data == null) {
      print("added new user");
      _db.collection("users").document(user.uid)
          .setData({
        'name': user.displayName,
        'photoUrl': user.photoUrl,
        'token': 0,
      });
    }
    name = value.data['name'];
    imageUrl = value.data['photoUrl'];
    token = value.data['token'];
    uid = user.uid;
  });

  return 'signInWithGoogle succeeded: $user';
}


void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
