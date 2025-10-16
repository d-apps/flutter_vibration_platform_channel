import 'package:equatable/equatable.dart';

class VibrationEntity extends Equatable {
  final int duration; // in milliseconds
  final int amplitude; // 1-255

  const VibrationEntity({
    required this.duration,
    required this.amplitude,
  });

  @override
  List<Object?> get props => [duration, amplitude];

  VibrationEntity copyWith({
    int? duration,
    int? amplitude,
  }) {
    return VibrationEntity(
      duration: duration ?? this.duration,
      amplitude: amplitude ?? this.amplitude,
    );
  }
}