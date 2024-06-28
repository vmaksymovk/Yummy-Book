
import SwiftUI

struct ContentView: View {
    @State private var isSelected : Int = 1
    var body: some View {
        TabView(selection: $isSelected,
                content:  {
            RecipesListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet.clipboard")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorite", systemImage: "star.circle.fill")
                }
        })
    }
}

#Preview {
    ContentView()
}
