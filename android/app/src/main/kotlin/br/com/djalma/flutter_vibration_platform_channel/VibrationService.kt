package br.com.djalma.flutter_vibration_platform_channel

import android.content.Context
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.Build
class VibrationService(private val context: Context) {
    fun triggerVibration(amplitude: Int) {
        val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val safeAmplitude = amplitude.coerceIn(1, 255) // Evita valores inválidos
            val effect = VibrationEffect.createOneShot(60000, safeAmplitude)
            vibrator.vibrate(effect)
        } else {
            @Suppress("DEPRECATION")
            vibrator.vibrate(durationMs)
        }
    }
}