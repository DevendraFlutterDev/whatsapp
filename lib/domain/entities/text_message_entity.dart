import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TextMessageEntity extends Equatable {
  final String? senderName;
  final String? sederUID;
  final String? recipientName;
  final String? recipientUID;
  final String messsageType;
  final String message;
  final String messageId;
  final Timestamp time;

  const TextMessageEntity({
     this.senderName,
     this.sederUID,
     this.recipientName,
     this.recipientUID,
    required this.messsageType,
    required this.message,
    required this.messageId,
    required this.time,
  });

  @override
  List<Object?> get props => [
    senderName,
    sederUID,
    recipientName,
    recipientUID,
    messsageType,
    message,
    messageId,
    time,
  ];

}