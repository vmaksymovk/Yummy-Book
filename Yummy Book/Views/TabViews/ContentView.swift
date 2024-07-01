
import SwiftUI

struct ContentView: View {
    @State private var isSelected : Int = 1
    @EnvironmentObject var favoritesManager: FavoritesManager
    var body: some View {
        TabView(selection: $isSelected,
                content:  {
            RecipesListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet.clipboard")
                }
                .tag(1)
            FavoritesView()
                .tabItem {
                    Label("Favorite", systemImage: "star.circle.fill")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(3)
        })
    }
}

#Preview {
    ContentView()
        .environmentObject(FavoritesManager())
}
