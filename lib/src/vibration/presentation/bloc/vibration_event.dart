import 'package:equatable/equatable.dart';

abstract class VibrationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UpdateDurationEvent extends VibrationEvent {
  final int duration;
  UpdateDurationEvent(this.duration);
}

final class UpdateAmplitudeEvent extends VibrationEvent {
  final int amplitude;
  UpdateAmplitudeEvent(this.amplitude);
}