//
//  RecipesViewModel.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 29/11/2022.
//

import Foundation


final class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe]
    
    
    init() {
        self.recipes = Recipe.all
    }
}
