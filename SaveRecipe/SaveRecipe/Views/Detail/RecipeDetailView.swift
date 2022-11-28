//
//  RecipeDetailView.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 29/11/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(width: 100, height: 100)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(colors: [Color.gray.opacity(0.3), Color.gray], startPoint: .top, endPoint: .bottom))
            
            VStack(alignment: .leading, spacing: 30) {
                showRecipeName()
                
                if !recipe.description.isEmpty {
                    Text(recipe.description)
                }
                
                if !recipe.ingredients.isEmpty {
                    showSpecificDetailType(with: "Ingredients",
                                           and: recipe.ingredients)
                }
                
                if !recipe.directions.isEmpty {
                    showSpecificDetailType(with: "Direction",
                                           and: recipe.directions)
                }
            }
            .padding(.horizontal)
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

//MARK: - View Methods
extension RecipeDetailView {
    private func showRecipeName() -> some View {
        VStack(spacing: 30) {
            Text(recipe.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
    
    private func showSpecificDetailType(with typeName: String, and receipeDetails: String) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(typeName)
                .font(.headline)
            
            Text(receipeDetails)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.all[0])
    }
}
