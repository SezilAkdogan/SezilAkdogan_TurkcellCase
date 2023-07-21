//
//  HomeInteractorTests.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import XCTest
@testable import SezilAkdogan_TurkcellCase

final class HomeInteractorTests: XCTestCase {
    
    func testFetchGames() {
        // Create the mock interactor and set up the test
        let mockInteractor = MockHomeInteractor()
        
        // Initial state checks
        XCTAssertFalse(mockInteractor.isInvokedFetchGames)
        XCTAssertEqual(mockInteractor.invokedFetchGamesCount, 0)
        
        // Call fetchGames method
        mockInteractor.fetchGames()
        
        // Check if fetchGames is correctly invoked
        XCTAssertTrue(mockInteractor.isInvokedFetchGames)
        XCTAssertEqual(mockInteractor.invokedFetchGamesCount, 1)
    }
    
}
