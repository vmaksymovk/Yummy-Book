
import Foundation
import SwiftUI
import Combine

class FavoritesManager: ObservableObject {
    @Published var favoriteRecipes: [Recipe] = []

    func addFavorite(recipe: Recipe) {
        if !favoriteRecipes.contains(where: { $0.id == recipe.id }) {
            favoriteRecipes.append(recipe)
        }
    }

    func removeFavorite(recipe: Recipe) {
        if let index = favoriteRecipes.firstIndex(where: { $0.id == recipe.id }) {
            favoriteRecipes.remove(at: index)
        }
    }

    func isFavorite(recipe: Recipe) -> Bool {
        return favoriteRecipes.contains(where: { $0.id == recipe.id })
    }
}
