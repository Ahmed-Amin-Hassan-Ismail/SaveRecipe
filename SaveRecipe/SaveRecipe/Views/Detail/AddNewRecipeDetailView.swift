//
//  AddNewRecipeDetailView.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 29/11/2022.
//

import SwiftUI

struct AddNewRecipeDetailView: View {
    @EnvironmentObject private var recipeViewModel: RecipesViewModel
    @State private var nameTF: String = ""
    @State private var categoryPicker: Category = .main
    @State private var descriptionTF: String = ""
    @State private var ingredientsTF: String = ""
    @State private var directionTF: String = ""
    @State private var NavigateToRecipeView: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Recipe Name", text: $nameTF)
                }
                
                Section("Category") {
                    Picker("", selection: $categoryPicker) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Discription") {
                    TextEditor(text: $descriptionTF)
                    
                    
                }
                
                Section("Ingredients") {
                    TextEditor(text: $ingredientsTF)
                    
                }
                
                Section("Directions") {
                    TextEditor(text: $directionTF)
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(isActive: $NavigateToRecipeView) {
                        navigateToRecipeViewScreen()
                    } label: {
                        Button {
                            saveNewRecipe()
                            NavigateToRecipeView = true
                        } label: {
                            Image(systemName: "checkmark")
                        }
                        .disabled(nameTF.isEmpty)
                    }
                }
            }
        }
        .navigationSplitViewStyle(.automatic)
    }
}

extension AddNewRecipeDetailView {
    private func saveNewRecipe() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let datePublisher = dateFormatter.string(from: now)
        
        let newRecipe = Recipe(
            name: nameTF,
            image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/159964/Roasted-Cauliflower-Soup-wordpress-360x270-c.jpg",
            description: descriptionTF,
            ingredients: ingredientsTF,
            directions: directionTF,
            category: categoryPicker.rawValue,
            datePublished: datePublisher,
            url: ""
        )
        recipeViewModel.saveNewRecipe(recipe: newRecipe)
    }
    
    private func navigateToRecipeViewScreen() -> some View {
        RecipeDetailView(recipe: recipeViewModel.recipes.sorted { $0.datePublished > $1.datePublished }[0])
            .navigationBarBackButtonHidden(true)
    }
}

struct AddNewRecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeDetailView()
            .environmentObject(RecipesViewModel())
    }
}
