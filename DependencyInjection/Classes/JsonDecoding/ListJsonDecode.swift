//
//  ListJsonDecode.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/29/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import Foundation

struct List: Decodable {
    let feed: Feed
    
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

struct Feed: Decodable {
    let title: String
    let id: String
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}


struct Result: Decodable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let collectionName: String
    let copyright: String
    let artistID: String
    let contentAdvisoryRating: String?
    let artistURL: String
    let artworkUrl100: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case releaseDate = "releaseDate"
        case name = "name"
        case collectionName = "collectionName"
        case copyright = "copyright"
        case artistID = "artistId"
        case contentAdvisoryRating = "contentAdvisoryRating"
        case artistURL = "artistUrl"
        case artworkUrl100 = "artworkUrl100"
        case url = "url"
    }
}
