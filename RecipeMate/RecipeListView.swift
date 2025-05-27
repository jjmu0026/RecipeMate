//
//  RecipeListView.swift
//  RecipeMate
//
//  Created by mina um on 5/24/25.
//

import SwiftUI
import SwiftData

struct RecipeListView: View {
    @Binding var recipes: [Recipe]
    @State private var newRecipe = Recipe.emptyRecipe
    @State private var isPresentingNewRecipeView = false
    
    var body: some View {
        NavigationStack {
            List(recipes.indices, id: \.self) { index in
                NavigationLink(destination: RecipeDetailView(recipe: $recipes[index])) {
                    RecipeCardView(recipe: recipes[index])
                }
                .listRowBackground(Color(.yellow))
            }
            .navigationTitle("My Recipes")
            .toolbar {
                Button(action: { isPresentingNewRecipeView = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingNewRecipeView) {
            NavigationStack {
                AddEditRecipeView(recipe: $newRecipe)
                    .navigationTitle("New Recipe")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingNewRecipeView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                recipes.append(newRecipe)
                                newRecipe = Recipe.emptyRecipe
                                isPresentingNewRecipeView = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    RecipeListView(recipes: .constant(Recipe.sampleRecipe))
}
