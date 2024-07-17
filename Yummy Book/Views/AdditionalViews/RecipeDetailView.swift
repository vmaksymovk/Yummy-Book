import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var showingShareSheet = false // State to control showing of share sheet
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding()
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                HStack {
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        showingShareSheet.toggle() // Toggle the state to show the share sheet
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .padding()
                    }
                    .sheet(isPresented: $showingShareSheet) {
                        // Share sheet content
                        ActivityViewController(activityItems: [shareText], applicationActivities: nil)
                    }
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                                .foregroundColor(.green)
                            Text(ingredient)
                                .padding(.leading, 5)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                Text("Steps")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                TabView {
                    ForEach(recipe.steps.indices, id: \.self) { index in
                        StepCardView(stepNumber: index + 1, stepText: recipe.steps[index])
                            .padding()
                            .frame(width: 250)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.horizontal, 20)
                            
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 200)
            }
            .padding(.vertical)
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    toggleFavorite()
                }) {
                    Image(systemName: favoritesManager.isFavorite(recipe: recipe) ? "star.fill" : "star")
                        .foregroundColor(favoritesManager.isFavorite(recipe: recipe) ? .yellow : .gray)
                        .font(favoritesManager.isFavorite(recipe: recipe) ? .title : .title2)
                        .padding()
                }
            }
        }
        
    }
    
    private func toggleFavorite() {
        if favoritesManager.isFavorite(recipe: recipe) {
            favoritesManager.removeFavorite(recipe: recipe)
        } else {
            favoritesManager.addFavorite(recipe: recipe)
        }
    }
    
    private var shareText: String {
        var text = "Check out the ingredients for \(recipe.name):\n\n"
        for ingredient in recipe.ingredients {
            text.append("- \(ingredient)\n")
        }
        return text
    }
}



struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(id: "", name: "Pizza", imageName: "pizza", ingredients: ["Dough", "Tomato Sauce", "Mozzarella Cheese", "Basil"], steps: ["Prepare the dough", "Spread the tomato sauce", "Add the mozzarella cheese", "Bake the pizza", "Garnish with basil"]))
            .environmentObject(FavoritesManager())
    }
}
