import 'package:equatable/equatable.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';

class VibrationState extends Equatable {
  final VibrationEntity vibrationEntity;

  const VibrationState(this.vibrationEntity);

  @override
  List<Object?> get props => [];
}