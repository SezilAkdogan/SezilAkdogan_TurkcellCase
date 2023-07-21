//
//  MockCoreDataManager.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockCoreDataManager: CoreDataManagerInterface {
    
    var stubbedFavorites: [Favourite] = []
    
    func addGameToFavourites(gameCore: GameDetailModel) {
        
    }
    
    func isFavourite(gameID: Int) -> Bool {
        
        return false
    }
    
    func removeGameFromFavourites(gameID: Int) {
        
    }
    
    func getAllFavourites() -> [Favourite] {
        return stubbedFavorites
    }
}
