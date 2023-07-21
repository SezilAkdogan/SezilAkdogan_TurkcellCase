//
//  MockDetailInteractor.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockDetailInteractor: DetailInteractorInterface {
    
    var isInvokedFetchGameDetails = false
    var invokedFetchGameDetailsCount = 0
    var isFavourite = false
    var isInvokedRemoveGameFromFavourites = false
    var isInvokedAddGameToFavourites = false
    var isInvokedPost = false

    func fetchGameDetails(slug: String) {
        isInvokedFetchGameDetails = true
        invokedFetchGameDetailsCount += 1
    }
    
    func removeGameFromFavourites(gameID: String) {
        isInvokedRemoveGameFromFavourites = true
    }
    
    func addGameToFavourites(gameCore: GameDetailModel) {
        isInvokedAddGameToFavourites = true
    }
    
    func isFavourite(gameID: String) -> Bool {
        return isFavourite
    }
    
    func post(with name: Notification.Name, object: Any?) {
        isInvokedPost = true
    }
}
