//
//  CategoryDetailView.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 29/11/2022.
//

import SwiftUI

struct CategoryDetailView: View {
    var category: Category
    
    var filteredRecipes: [Recipe] {
        Recipe.all.filter({ $0.category == category.rawValue })
    }
    
    var body: some View {
        RecipeList(recipes: filteredRecipes)
            .navigationTitle(category.rawValue + "s")
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(category: .breakfast)
    }
}
