import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            if favoritesManager.favoriteRecipes.isEmpty {
                VStack(alignment: .center){
                    
                    Image(systemName: "star.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                        .padding()
                    
                    Text("You haven't added any recipes to favorites yet.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
                
                .navigationTitle("Favorites")
            } else {
                List(favoritesManager.favoriteRecipes) { recipe in
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
                .navigationTitle("Favorites")
            }
        }
    }
}



#Preview {
    FavoritesView()
        .environmentObject(FavoritesManager())
}
