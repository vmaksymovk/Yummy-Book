import Foundation
import SwiftUI

class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    init() {
        loadRecipesFromJSON()
    }

    func loadRecipesFromJSON() {
        if let fileURL = Bundle.main.url(forResource: "recipes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                self.recipes = try decoder.decode([Recipe].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
