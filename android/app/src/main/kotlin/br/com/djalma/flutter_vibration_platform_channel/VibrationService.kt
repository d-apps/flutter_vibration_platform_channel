package com.example.flutter_vibration_platform_channel

import android.content.Context
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.Build
class VibrationService(private val context: Context) {
    fun triggerVibration(durationMs: Long, amplitude: Int) {
        val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val safeAmplitude = amplitude.coerceIn(1, 255) // Evita valores inválidos
            val effect = VibrationEffect.createOneShot(durationMs, safeAmplitude)
            vibrator.vibrate(effect)
        } else {
            @Suppress("DEPRECATION")
            vibrator.vibrate(durationMs)
        }
    }
}