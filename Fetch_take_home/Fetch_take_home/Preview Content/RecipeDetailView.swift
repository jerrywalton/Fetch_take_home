//
//  RecipeDetailView.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//
import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                let photo_url = Utils.getPlaceHolderForEmptyURL(recipe: recipe, sourceUrlType: .photo_url_large)
                AsyncImage(url: URL(string:  photo_url)) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(maxWidth: .infinity)
                         .cornerRadius(10)
                } placeholder: {
                    Color.gray.opacity(0.2)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                }

                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(recipe.cuisine)
                    .font(.title3)
                    .foregroundColor(.gray)

                let source_url = Utils.getPlaceHolderForEmptyURL(recipe: recipe, sourceUrlType: .source_url)
                Link("View Recipe", destination: URL(string: source_url)!)
                    .font(.body)
                    .foregroundColor(.blue)

                let youtube_url = Utils.getPlaceHolderForEmptyURL(recipe: recipe, sourceUrlType: .youtube_url)
                Link("Watch on YouTube", destination: URL(string: youtube_url)!)
                    .font(.body)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle(recipe.name)
    }
}

