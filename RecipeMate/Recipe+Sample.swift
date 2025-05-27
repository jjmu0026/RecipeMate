//
//  Recipe+Sample.swift
//  RecipeMate
//
//  Created by mina um on 5/25/25.
//

import Foundation

extension Recipe {
    static let sampleRecipe: [Recipe] =
    [
        Recipe(title: "Matcha Latte",
               ingredients: ["Matcha powder", "Maple syrup", "Milk", "Water"],
               time: 5,
               steps: ["Whisk the matcha powder with water", "Once frothed, put in some maple syrup", "Pour milk of your choice into your cup, and pour over the matcha mixture on top"],
               notes: "",
               imageData: nil,
               isFavorite: true),
        
        Recipe(title: "Avocado Toast",
                       ingredients: ["Bread", "Avocado", "Salt", "Black pepper", "Lemon juice", "Red pepper flakes"],
                       time: 10,
                       steps: ["Toast the bread until golden brown", "Mash the avocado in a bowl", "Add salt, pepper, and lemon juice to the mashed avocado", "Spread avocado mixture on toast", "Sprinkle with red pepper flakes"],
                       notes: "Add a fried egg on top for extra protein!",
                       imageData: nil,
                       isFavorite: false),
                
        Recipe(title: "Chocolate Chip Cookies",
               ingredients: ["Flour", "Butter", "Brown sugar", "White sugar", "Eggs", "Vanilla extract", "Baking soda", "Salt", "Chocolate chips"],
               time: 25,
               steps: ["Preheat oven to 375°F", "Cream butter and sugars together", "Beat in eggs and vanilla", "Mix in flour, baking soda, and salt", "Fold in chocolate chips", "Drop spoonfuls on baking sheet", "Bake for 9-11 minutes"],
               notes: "Let cool on baking sheet for 5 minutes before transferring",
               imageData: nil,
               isFavorite: true),
        
        Recipe(title: "Greek Salad",
               ingredients: ["Cucumber", "Tomatoes", "Red onion", "Feta cheese", "Olives", "Olive oil", "Lemon juice", "Oregano", "Salt", "Pepper"],
               time: 15,
               steps: ["Dice cucumber and tomatoes", "Thinly slice red onion", "Combine vegetables in a large bowl", "Add olives and crumbled feta", "Whisk olive oil, lemon juice, oregano, salt and pepper", "Pour dressing over salad and toss"],
               notes: "Best when served immediately after dressing",
               imageData: nil,
               isFavorite: false)
    ]
}
