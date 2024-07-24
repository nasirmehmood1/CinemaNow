// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BookingModel {
  String bookedMovieName;
  String bookedMoveImage;
  List<Map<String, int>> bookedSeatLocations;
  ValueNotifier<double> bookedSeatPrice;
  BookingModel({
    required this.bookedMovieName,
    required this.bookedMoveImage,
    required this.bookedSeatLocations,
    required this.bookedSeatPrice,
  });
}

List<Map<String, int>> selectedChairs = [];
