//
//  RecipeCardView.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//
import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            let url = Utils.getPlaceHolderForEmptyURL(recipe: recipe, sourceUrlType: .photo_url_small)
            AsyncImage(url: URL(string:  url)) { image in
                image.resizable()
                     .scaledToFill()
                     .frame(width: 100, height: 100)
                     .cornerRadius(10)
            } placeholder: {
                Color.gray.opacity(0.2)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.bottom, 2)
                
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

