import 'package:equatable/equatable.dart';

abstract class VibrationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UpdateAmplitudeEvent extends VibrationEvent {
  final int amplitude;
  UpdateAmplitudeEvent(this.amplitude);
}