
import SwiftUI

@main
struct Yummy_BookApp: App {
    @StateObject private var favoritesManager = FavoritesManager()
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesManager)
                .environment(\.isDarkMode, isDarkMode)
        }
    }
}
