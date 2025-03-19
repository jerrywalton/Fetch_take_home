//
//  RecipeListView.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//
import SwiftUI

struct RecipeListView: View {
    @StateObject var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.recipes.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeCardView(recipe: recipe)
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.fetchRecipes() // Fetch recipes when the view appears
                //await viewModel.loadRecipesFromStaticJSON()
            }
        }
    }
}
