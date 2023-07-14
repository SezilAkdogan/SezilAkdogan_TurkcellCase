//
//  GameDetail.swift
//  
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import Foundation

// MARK: - Game
public struct Game: Decodable {
    public let results: [GameResult]?
}

// MARK: - GameResult
public struct GameResult: Decodable {
    public let id: Int?
    public let slug: String?
    public let name: String?
    public let released: String?
    public let backgroundImage: String?
    public let rating: Double?

    public enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case released
        case backgroundImage = "background_image"
        case rating
    }
}
