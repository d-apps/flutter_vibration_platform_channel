package br.com.djalma.flutter_vibration_platform_channel

import android.content.Context
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.Build
class VibrationService(private val context: Context) {

    fun triggerVibration(amplitude: Int) {

        val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        val safeAmplitude = amplitude.coerceIn(1, 255) // Evita valores inválidos
        val duration = 600000L // duração em milissegundos (10 minutos)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val effect = VibrationEffect.createOneShot(duration, safeAmplitude)
            vibrator.vibrate(effect)
        } else {
            @Suppress("DEPRECATION")
            vibrator.vibrate(duration)
        }
    }

}