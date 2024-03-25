import SwiftUI
import OSLog

@MainActor
class EmojiSentence: ObservableObject {
    @Published var text = ""
    @Published var emoji = ""
    

    private let sentences = [
        (text: "Not my cup of tea", emoji: "🙅‍♀️ ☕️"),
        (text: "Talk to the hand", emoji: "🎙 ✋"),
        (text: "Not the brightest bulb", emoji: "🚫 😎 💡"),
        (text: "When horse fly", emoji: "⏰ 🐎 ✈️"),
        (text: "Boy who cried wolf", emoji: "🚶😭🐺")
    ]
    private var index = 0

    init() {
        update()
    }

    func next() {
        index += 1
        index %= sentences.count
        Logger.general.debug("Index = \(self.index)")
        update()
    }

    private func update() {
        text = sentences[index].text
        emoji = sentences[index].emoji
    }
}

import OSLog

extension Logger {
    /// Using your bundle identifier is a great way to ensure a unique identifier.
    private static var subsystem = Bundle.main.bundleIdentifier!

    /// General purpose logger
    static let general = Logger(subsystem: subsystem, category: "General")
}
