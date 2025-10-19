import 'package:dartz/dartz.dart';
import '../../../../core/services/vibration_service.dart';

abstract class ITriggerVibrationUseCase {
  Future<Either<Exception, void>> call(int amplitude);
}

class TriggerVibrationUseCase implements ITriggerVibrationUseCase {
  final IVibrationService _service;

  TriggerVibrationUseCase({
    required IVibrationService service
  }) : _service = service;

  @override
  Future<Either<Exception, void>> call(int amplitude) async {
    try {
      await _service.vibrate(amplitude);
      return const Right(null);
    } catch(e){
      return Left(Exception('Error triggering vibration: $e'));
    }
  }
}