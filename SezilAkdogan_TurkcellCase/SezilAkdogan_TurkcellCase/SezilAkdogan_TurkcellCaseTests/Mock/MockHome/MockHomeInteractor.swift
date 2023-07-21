//
//  MockHomeInteractor.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockHomeInteractor: HomeInteractorInterface {
    
    var isInvokedFetchGames = false
    var invokedFetchGamesCount = 0
    
    func fetchGames() {
        isInvokedFetchGames = true
        invokedFetchGamesCount += 1
    }
    
}
