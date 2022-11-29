//
//  NewRecipeView.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 28/11/2022.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddNewRecipe: Bool = false
    
    var body: some View {
        NavigationView {
            Button(action: {
                self.showAddNewRecipe = true
            }, label: {
                Text("Add New Recipe")
            })
            .navigationTitle("New Recipe")
        }
        .sheet(isPresented: $showAddNewRecipe, content: {
            AddNewRecipeDetailView()
        })
        .navigationSplitViewStyle(.automatic)
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
