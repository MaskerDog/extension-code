import SwiftUI

extension Color {
    
    /// 16進数表現の色文字列からColorを生成する。
    /// 色文字列からColorが生成ができない場合は**黒のColor**を生成する。
    /// - Parameters:
    ///   - hex: 16進数の色文字列
    ///   - opacity: 透明度
    init(hex: String, opacity: CGFloat = 1.0) {
        let hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        // 文字数が6じゃない場合は不正文字列
        guard hexFormatted.count == 6 else {
            self.init(red: 0, green: 0, blue: 0)
            return
        }
        
        var rgbValue: UInt64 = 0
        // String値をInt64にする。できない場合は不正文字列
        guard Scanner(string: hexFormatted).scanHexInt64(&rgbValue) else {
            self.init(red: 0, green: 0, blue: 0)
            return
        }
        
        
        
        self.init(red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: Double((rgbValue & 0x0000FF)) / 255.0,
                  opacity: opacity)
    }
}
