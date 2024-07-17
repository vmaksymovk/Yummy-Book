import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel = RecipesViewModel()
    @State private var searchTerm = ""
    @Environment(\.isDarkMode) private var isDarkMode
    var filteredRecipes: [Recipe] {
        if searchTerm.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { recipe in
                recipe.name.lowercased().contains(searchTerm.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if filteredRecipes.isEmpty {
                    ContentUnavailableView.search
                } else {
                    List(filteredRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            HStack {
                                if let image = UIImage(named: recipe.imageName) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 70, height: 60)
                                        .cornerRadius(8)
                                } else {
                                    // Placeholder for missing image
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 70, height: 60)
                                        .cornerRadius(8)
                                }
                                Text(recipe.name)
                                    .font(.title2)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .searchable(text: $searchTerm, placement: .automatic, prompt: "Search recipe")
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    RecipesListView()
        .environmentObject(FavoritesManager())
}
