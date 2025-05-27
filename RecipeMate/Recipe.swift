//
//  Recipe.swift
//  RecipeMate
//
//  Created by mina um on 5/24/25.
//

import Foundation
import SwiftData

@Model
class Recipe: Identifiable {
    var id: UUID
    var title: String
    var ingredients: [String]
    var time: Int
    var timeAsDouble: Double {
        get {
            Double(time)
        }
        set {
            time = Int(newValue)
        }
    }
    var steps: [String]
    var notes: String
    var imageData: Data?
    var isFavorite: Bool
    
    init(id: UUID = UUID(), title: String, ingredients: [String], time: Int, steps: [String], notes: String, imageData: Data?, isFavorite: Bool) {
        self.id = id
        self.title = title
        self.ingredients = ingredients
        self.time = time
        self.steps = steps
        self.notes = notes
        self.imageData = imageData
        self.isFavorite = isFavorite
    }
}

extension Recipe {
    struct Ingredient: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    struct Step: Identifiable {
        var id: UUID
        var content: String

        init(id: UUID = UUID(), content: String) {
            self.id = id
            self.content = content
        }
    }
    static var emptyRecipe: Recipe {
        Recipe(title: "", ingredients: [], time: 0, steps: [], notes: "", imageData: nil, isFavorite: false)
    }
}
