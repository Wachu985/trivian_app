import 'package:equatable/equatable.dart';

abstract class Trivian extends Equatable {
  const Trivian({
    required this.text,
    required this.number,
    required this.found,
    required this.type,
  });

  final String text;
  final int number;
  final bool found;
  final String type;
}
