import 'package:dartz/dartz.dart';

import '../../../../core/services/vibration_service.dart';
import '../entities/vibration_entity.dart';

abstract class ITriggerVibrationUseCase {
  Future<Either<Exception, void>> call(VibrationEntity vibration);
}

class TriggerVibrationUseCase implements ITriggerVibrationUseCase {
  final IVibrationService _service;

  TriggerVibrationUseCase({
    required IVibrationService service
  }) : _service = service;

  @override
  Future<Either<Exception, void>> call(VibrationEntity vibration) async {
    try {
      await _service.vibrate(vibration);
      return const Right(null);
    } catch(e){
      return Left(Exception('Error triggering vibration: $e'));
    }
  }
}