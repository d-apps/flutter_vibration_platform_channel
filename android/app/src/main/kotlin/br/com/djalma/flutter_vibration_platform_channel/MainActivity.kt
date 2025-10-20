package br.com.djalma.flutter_vibration_platform_channel

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.os.Build
import android.os.Bundle
import android.os.VibrationEffect
import android.os.Vibrator
import androidx.annotation.NonNull

class MainActivity : FlutterActivity() {
    private val CHANNEL = "vibration"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val vibrationService = VibrationService(this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "vibrate" -> {
                        val amplitude = call.argument<Int>("amplitude") ?: 128
                        vibrationService.triggerVibration(amplitude)
                        result.success("Vibration triggered")
                    }
                    else -> result.notImplemented()
                }
            }
    }
}


