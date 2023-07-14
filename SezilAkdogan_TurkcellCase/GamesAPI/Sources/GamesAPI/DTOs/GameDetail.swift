//
//  File.swift
//  
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import Foundation

// MARK: - GameDetail
public struct GameDetail: Decodable {
    public var id: Int?
    public let slug: String?
    public let name: String?
    public let released: String?
    public let backgroundImage: String?
    public let rating: Double?
    public let description: String?
    public let metacritic: Int?

    public enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name, released
        case backgroundImage = "background_image"
        case rating
        case description
        case metacritic
    }
}
