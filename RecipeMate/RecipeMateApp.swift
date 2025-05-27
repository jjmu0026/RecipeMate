//
//  RecipeMateApp.swift
//  RecipeMate
//
//  Created by mina um on 5/24/25.
//

import SwiftUI
import SwiftData

@main
struct RecipeMateApp: App {
    @State private var recipes = Recipe.sampleRecipe
    
    var body: some Scene {
        WindowGroup {
            RecipeListView(recipes: $recipes)
        }
    }
}
