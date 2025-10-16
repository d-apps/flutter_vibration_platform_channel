import UIKit
import AudioToolbox

class VibrationService {
    func triggerVibration(durationMs: Int, amplitude: Int) {
        // O iOS não permite controle direto de amplitude/duração como o Android.
        // Vamos simular a vibração usando os padrões disponíveis.

        if #available(iOS 10.0, *) {
            // Usa feedback háptico moderno
            let generator = UIImpactFeedbackGenerator(style: impactStyle(for: amplitude))
            generator.prepare()
            generator.impactOccurred()
        } else {
            // Fallback para dispositivos antigos
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }

    // Mapeia amplitude em um "estilo" de impacto háptico
    private func impactStyle(for amplitude: Int) -> UIImpactFeedbackGenerator.FeedbackStyle {
        switch amplitude {
        case 0..<85:
            return .light
        case 85..<170:
            return .medium
        default:
            return .heavy
        }
    }

}
