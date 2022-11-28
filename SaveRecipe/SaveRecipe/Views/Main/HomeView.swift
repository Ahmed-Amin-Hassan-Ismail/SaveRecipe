//
//  HomeView.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 28/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            RecipeList(recipes: Recipe.all)            
                .navigationTitle("My Recips")
        }
        .navigationSplitViewStyle(.automatic)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
