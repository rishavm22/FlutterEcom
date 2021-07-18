import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';


late GoogleSignInAccount accountGoogle;
final refInstitute = FirebaseFirestore.instance.collection('institute');
final refUserDetail = FirebaseFirestore.instance.collection('user');