//
//  RecipeCardView.swift
//  RecipeMate
//
//  Created by mina um on 5/25/25.
//

import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("", systemImage: recipe.isFavorite ? "star.fill" : "star")
                Spacer()
                Label("\(recipe.time)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
            }
            .font(.callout)
        }
        .padding()
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let recipe = Recipe.sampleRecipe[0]
    return RecipeCardView(recipe: recipe)
}
