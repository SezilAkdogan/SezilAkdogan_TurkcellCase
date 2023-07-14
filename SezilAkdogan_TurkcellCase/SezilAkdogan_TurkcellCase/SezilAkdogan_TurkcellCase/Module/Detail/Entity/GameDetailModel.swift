//
//  GameDetailModel.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import Foundation

struct GameDetailModel: Decodable {
    var id: Int?
    let slug: String?
    let name: String?
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    let description: String?
    let metacritic: Int?
}
