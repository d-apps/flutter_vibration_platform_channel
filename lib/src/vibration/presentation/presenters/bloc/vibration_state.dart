import 'package:equatable/equatable.dart';

class VibrationState extends Equatable {
  final int amplitude;

  const VibrationState(this.amplitude);

  @override
  List<Object?> get props => [amplitude];
}