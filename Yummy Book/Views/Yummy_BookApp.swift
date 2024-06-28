
import SwiftUI

@main
struct Yummy_BookApp: App {
    @StateObject private var favoritesManager = FavoritesManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesManager)
        }
    }
}
