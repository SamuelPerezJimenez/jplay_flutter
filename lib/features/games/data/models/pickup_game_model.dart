import 'package:flutter/material.dart';

class PickUpGame {
  final String name;
  final String description;
  final int maxParticipants;
  final int registeredParticipants;
  final DateTime date;
  final TimeOfDay time;
  final int idSport;

  PickUpGame(
      {required this.name,
      required this.description,
      required this.maxParticipants,
      required this.registeredParticipants,
      required this.date,
      required this.time,
      required this.idSport});
}

List<PickUpGame> pickUpGames = [
  PickUpGame(
      name: "SoccerZone, Cedar Park",
      description: "OUTDOOR 5 VS 5",
      maxParticipants: 12,
      registeredParticipants: 9,
      date: DateTime.now(),
      time: const TimeOfDay(hour: 15, minute: 0),
      idSport: 1),
  PickUpGame(
      name: "Football Ground, Downtown",
      description: "INDOOR 6 VS 6",
      maxParticipants: 14,
      registeredParticipants: 8,
      date: DateTime.now().add(const Duration(days: 1)),
      time: const TimeOfDay(hour: 16, minute: 30),
      idSport: 1),
  PickUpGame(
      name: "Stadium Park, WestSide",
      description: "OUTDOOR 7 VS 7",
      maxParticipants: 16,
      registeredParticipants: 13,
      date: DateTime.now().add(const Duration(days: 2)),
      time: const TimeOfDay(hour: 17, minute: 0),
      idSport: 2),
  PickUpGame(
      name: "Basketball Court, EastEnd",
      description: "INDOOR 3 VS 3",
      maxParticipants: 8,
      registeredParticipants: 5,
      date: DateTime.now().add(const Duration(days: 3)),
      time: const TimeOfDay(hour: 18, minute: 15),
      idSport: 3),
  PickUpGame(
      name: "Tennis Court, Uptown",
      description: "SINGLES MATCH",
      maxParticipants: 2,
      registeredParticipants: 1,
      date: DateTime.now().add(const Duration(days: 4)),
      time: const TimeOfDay(hour: 14, minute: 45),
      idSport: 1),
];
