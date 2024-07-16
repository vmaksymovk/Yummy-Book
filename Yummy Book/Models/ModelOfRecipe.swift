import Foundation
import SwiftUI

struct Recipe: Identifiable, Codable {
    let id: String
    let name: String
    let imageName: String
    let ingredients: [String]
    let steps: [String]
}

