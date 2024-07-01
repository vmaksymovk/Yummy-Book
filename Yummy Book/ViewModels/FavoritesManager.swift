import SwiftUI
import Combine

class FavoritesManager: ObservableObject {
    @Published var favoriteRecipes: [Recipe] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    private let favoritesKey = "favoriteRecipes"
    
    init() {
        loadFavorites()
    }
    
    func addFavorite(recipe: Recipe) {
        if !favoriteRecipes.contains(where: { $0.id == recipe.id }) {
            favoriteRecipes.append(recipe)
        }
    }
    
    func removeFavorite(recipe: Recipe) {
        favoriteRecipes.removeAll { $0.id == recipe.id }
    }
    
    func isFavorite(recipe: Recipe) -> Bool {
        favoriteRecipes.contains(where: { $0.id == recipe.id })
    }
    
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteRecipes) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
    
    private func loadFavorites() {
        if let savedFavorites = UserDefaults.standard.data(forKey: favoritesKey),
           let decoded = try? JSONDecoder().decode([Recipe].self, from: savedFavorites) {
            favoriteRecipes = decoded
        }
    }
}
