//
//  Recipe.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//
import Foundation

struct Recipes : Codable {
    let recipes: [Recipe]
    enum CodingKeys: String, CodingKey {
        case recipes = "recipes"
    }
}

struct Recipe: Identifiable, Codable {
    let id = UUID() // auto gen a uniq ID
    let cuisine: String
    let name: String
    var photoURLLarge: String?
    var photoURLSmall: String?
    var sourceURL: String?
    let uuid: String
    var youtubeURL: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine, name, uuid, sourceURL = "source_url", youtubeURL = "youtube_url"
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
    }
    
}

