import 'package:equatable/equatable.dart';

class VibrationEntity extends Equatable {
  final int duration; // in seconds
  final int strength; // 1 to 5 scale

  const VibrationEntity({
    required this.duration,
    required this.strength,
  });

  @override
  List<Object?> get props => [duration, strength];
}