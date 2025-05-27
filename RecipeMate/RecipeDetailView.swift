//
//  RecipeDetailView.swift
//  RecipeMate
//
//  Created by mina um on 5/24/25.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var recipe: Recipe
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Ingredients")) {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
            Section(header: Text("Steps")) {
                ForEach(recipe.steps, id: \.self) { step in
                    Text(step)
                }
            }
            Section(header: Text("Notes")) {
                Text(recipe.notes)
            }
            Section(header: Text("Photos")) {
                
            }
        }
        .navigationTitle(recipe.title)
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                AddEditRecipeView(recipe: $recipe)
                    .navigationTitle("Edit Recipe")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    isPresentingEditView = true
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    withAnimation {
                        recipe.isFavorite.toggle()
                    }
                }) {
                    Label("", systemImage: recipe.isFavorite ? "star.fill" : "star")
                        .foregroundColor(recipe.isFavorite ? .yellow : .gray)
                }
            }
        }
        .safeAreaInset(edge: .top) {
            HStack {
                Label(formatTime(minutes: recipe.time), systemImage: "clock")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial)
        }
    }
    
    private func formatTime(minutes: Int) -> String {
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        
        if hours > 0 {
            return "\(hours) hour\(hours > 1 ? "s" : "") \(remainingMinutes > 0 ? "and \(remainingMinutes) minute\(remainingMinutes > 1 ? "s" : "")" : "")"
        } else {
            return "\(minutes) minute\(minutes > 1 ? "s" : "")"
        }
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: .constant(Recipe.sampleRecipe[0]))
    }
}
