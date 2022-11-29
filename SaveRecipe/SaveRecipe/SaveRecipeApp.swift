//
//  SaveRecipeApp.swift
//  SaveRecipe
//
//  Created by Ahmed Amin on 28/11/2022.
//

import SwiftUI

@main
struct SaveRecipeApp: App {
    @StateObject private var recipesViewModel = RecipesViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
