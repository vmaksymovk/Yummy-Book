import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel = RecipesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    HStack {
                        Image(recipe.imageName)
                            .resizable()
                            .frame(width: 70, height: 60)
                            .cornerRadius(8)
                        Text(recipe.name)
                            .font(.title2)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}


#Preview {
    RecipesListView()
        .environmentObject(FavoritesManager())
}
