//
//  RecipeList.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 29/11/2022.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    
    private let colomusItem = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                    
                    Spacer()
                }
                
                LazyVGrid(columns: colomusItem, spacing: 15) {
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            RecipeCard(recipe: recipe)
                        }

                    }
                }
                .padding(.top)
                
            }
            .padding(.horizontal)
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
        }
    }
}
