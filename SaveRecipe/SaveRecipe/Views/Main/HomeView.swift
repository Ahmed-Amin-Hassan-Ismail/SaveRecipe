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
            Text("My Recips")
                .navigationTitle("My Recips")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
