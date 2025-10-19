
abstract class VibrationPresenter {
  Stream<int> get amplitudeStream;
  void updateAmplitude(int value);
  Future<void> vibrate();
}