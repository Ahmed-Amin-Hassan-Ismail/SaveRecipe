//
//  AddNewRecipeDetailView.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 29/11/2022.
//

import SwiftUI

struct AddNewRecipeDetailView: View {
    @State private var nameTF: String = ""
    @State private var categoryPicker: Category = .main
    @State private var discriptionTF: String = ""
    @State private var ingredientsTF: String = ""
    @State private var directorTF: String = ""
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
                    TextEditor(text: $discriptionTF)
                    
                    
                }
                
                Section("Ingredients") {
                    TextEditor(text: $ingredientsTF)
                    
                }
                
                Section("Directions") {
                    TextEditor(text: $directorTF)
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
                        
                    } label: {
                        Button {
                            
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

struct AddNewRecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeDetailView()
    }
}
