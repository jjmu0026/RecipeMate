//
//  AddEditRecipeView.swift
//  RecipeMate
//
//  Created by mina um on 5/24/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddEditRecipeView: View {
    @Binding var recipe: Recipe
    @Environment(\.dismiss) private var dismiss
    @State private var ingredientName = ""
    @State private var stepContent = ""
    @State private var hours = 0
    @State private var minutes = 0
    @State private var showingTimePicker = false
    @State private var selectedPhotos: [PhotosPickerItem] = []
    @State private var recipeImages: [Image] = []
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Title", text: $recipe.title)
            }
            Section(header: Text("Cooking Time")) {
                Button(action: {
                    showingTimePicker = true
                }) {
                    HStack {
                        Text("Cooking Time")
                        Spacer()
                        Text(formatTime(hours: hours, minutes: minutes))
                            .foregroundColor(.gray)
                    }
                }
                .sheet(isPresented: $showingTimePicker) {
                    NavigationView {
                        VStack {
                            HStack {
                                Picker("Hours", selection: $hours) {
                                    ForEach(0..<24) { hour in
                                        Text("\(hour)").tag(hour)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(width: 100)
                                
                                Text("hours")
                                
                                Picker("Minutes", selection: $minutes) {
                                    ForEach(0..<60) { minute in
                                        Text("\(minute)").tag(minute)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(width: 100)
                                
                                Text("minutes")
                            }
                            .padding()
                        }
                        .navigationTitle("Select Time")
                        .navigationBarItems(trailing: Button("Done") {
                            recipe.time = (hours * 60) + minutes
                            showingTimePicker = false
                        })
                    }
                }
            }
            Section(header: Text("Ingredients")) {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
                .onDelete { indices in
                    recipe.ingredients.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Ingredient", text: $ingredientName)
                    Button(action: {
                        withAnimation {
                            recipe.ingredients.append(ingredientName)
                            ingredientName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            Section(header: Text("Steps")) {
                ForEach(recipe.steps, id: \.self) { step in
                    Text(step)
                }
                .onDelete { steps in
                    recipe.steps.remove(atOffsets: steps)
                }
                HStack {
                    TextField("New Step", text: $stepContent)
                    Button(action: {
                        withAnimation {
                            recipe.steps.append(stepContent)
                            stepContent = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            Section(header: Text("Notes")) {
                TextField("Notes", text: $recipe.notes)
            }
            Section(header: Text("Photos")) {
                PhotosPicker(selection: $selectedPhotos,
                           maxSelectionCount: 5,
                           matching: .images) {
                    Label("Select Photos", systemImage: "photo.on.rectangle.angled")
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0..<recipeImages.count, id: \.self) { index in
                            recipeImages[index]
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    Button(action: {
                                        recipeImages.remove(at: index)
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.white)
                                            .background(Color.black.opacity(0.5))
                                            .clipShape(Circle())
                                    }
                                    .padding(5),
                                    alignment: .topTrailing
                                )
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    private func formatTime(hours: Int, minutes: Int) -> String {
        if hours > 0 {
            return "\(hours) hour\(hours > 1 ? "s" : "") \(minutes > 0 ? "and \(minutes) minute\(minutes > 1 ? "s" : "")" : "")"
        } else {
            return "\(minutes) minute\(minutes > 1 ? "s" : "")"
        }
    }
}

#Preview {
    AddEditRecipeView(recipe: .constant(Recipe.emptyRecipe))
}
