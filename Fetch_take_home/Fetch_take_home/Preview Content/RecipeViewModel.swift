//
//  RecipeViewModel.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: Recipes = Recipes(recipes: [])
    
    func fetchRecipes() async {
        print("fetchRecipes")
        let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json" // fetch take home
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let str = String(decoding: data, as: UTF8.self)
            print("\(str)")
            let decodedRecipes = try decoder.decode(Recipes.self, from: data)
            weak var weakSelf = self
            DispatchQueue.main.async {
                weakSelf?.recipes = decodedRecipes
            }
        } catch {
            print("Failed to fetch or decode recipes: \(error)")
        }
    }
    
    func loadRecipesFromStaticJSON() async {
        print("loadRecipesFromStaticJSON")
        if let jsonURL = Bundle.main.url(forResource: "recipes", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                let jsonDecoder = JSONDecoder()
                let decodedRecipes = try jsonDecoder.decode(Recipes.self, from: jsonData)
                //print("\(decodedRecipes)")
                weak var weakSelf = self
                DispatchQueue.main.async {
                    weakSelf?.recipes = decodedRecipes
                }
            } catch {
                print(error)
            }
        }
    }
}
