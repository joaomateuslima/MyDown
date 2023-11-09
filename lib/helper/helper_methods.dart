import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp) {
  //timestamp is the object we retrieve from firebase
  //so to display it, lets convert it to a string
  DateTime dateTime = timestamp.toDate();

  //get year
  String year = dateTime.year.toString();

  String month = dateTime.month.toString();

  String day = dateTime.day.toString();

  //final formatted date
  String formatData = "$day/$month/$year";

  return formatData;
}
