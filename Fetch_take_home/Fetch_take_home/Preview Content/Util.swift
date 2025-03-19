//
//  Util.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//

enum SourceURLType {
    case photo_url_large, photo_url_small, source_url, youtube_url
}

let photo_url_large = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg"
let photo_url_small = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
let source_url = "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ"
let youtube_url = "https://www.youtube.com/watch?v=6R8ffRRJcrg"

struct Utils {
    static func getPlaceHolderForEmptyURL(recipe: Recipe, sourceUrlType: SourceURLType) -> String {

        // return the url a placeholder url
        switch(sourceUrlType) {
        case .photo_url_large:
            if let url = recipe.photoURLLarge {
                return url
            } else {
                return photo_url_large
            }
        case .photo_url_small:
            if let url = recipe.photoURLSmall {
                return url
            } else {
                return photo_url_small
            }
        case .source_url:
            if let url = recipe.sourceURL {
                return url
            } else {
                return source_url
            }
        case .youtube_url:
            if let url = recipe.youtubeURL {
                return url
            } else {
                return youtube_url

            }
        }
    }
}

