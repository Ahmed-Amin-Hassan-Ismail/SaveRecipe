//
//  CategoriesView.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 28/11/2022.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List(Category.allCases) { category in
                
                NavigationLink {
                    CategoryDetailView(category: category)
                } label: {
                    Text(category.rawValue + "s")
                }
            }
            .navigationTitle("Categories")
        }
        .navigationSplitViewStyle(.automatic)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
