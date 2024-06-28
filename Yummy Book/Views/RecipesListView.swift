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
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                        Text(recipe.name)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding()

                Text("Ingredients")
                    .font(.headline)
                    .padding(.horizontal)

                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .padding(.horizontal)
                }

                Text("Steps")
                    .font(.headline)
                    .padding(.horizontal)

                ForEach(recipe.steps, id: \.self) { step in
                    Text(step)
                        .padding(.horizontal)
                }
            }
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipesListView()
}
