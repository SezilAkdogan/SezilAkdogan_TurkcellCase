//
//  FavouritePresenterTests.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import XCTest
import GamesAPI
import CoreData
@testable import SezilAkdogan_TurkcellCase

final class FavouritePresenterTests: XCTestCase {
    
    var presenter: FavouritePresenter!
    var mockView: MockFavouriteViewController!
    var mockInteractor: MockFavouriteInteractor!
    var mockRouter: MockFavouriteRouter!
    let mockCoreDataManager = MockCoreDataManager()
    
    override func setUp() {
        super.setUp()
        
        mockView = MockFavouriteViewController()
        mockRouter = MockFavouriteRouter()
        mockInteractor = MockFavouriteInteractor()
        presenter = FavouritePresenter(
            router: mockRouter,
            interactor: mockInteractor,
            view: mockView,
            coreDataManager: mockCoreDataManager
        )
    }
    
    override func tearDown() {
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        presenter = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(mockView.prepareUICalled)
    }
    
    func testFetchFavourites() {
       
        presenter.viewDidLoad()
        XCTAssertTrue(mockView.reloadDataCalled)
        XCTAssertTrue(mockView.updateEmptyViewCalled)
        XCTAssertEqual(mockView.isHiddenValue, false)
    }
//
//    func testGetAllFavorites() {
//        // Create the sample favorites data
//        let favoriteModel = Favourite(nameText: "Game Name", releasedText: "2023-07-20", backgroundImage: nil, ratings: nil, slug: "game-slug")
//        let sampleFavorites = [favoriteModel]
//        mockCoreDataManager.stubbedFavorites = sampleFavorites
//
//        // Initially, the view methods should not be invoked
//        XCTAssertFalse(mockView.reloadDataCalled)
//        XCTAssertFalse(mockView.showLoadingCalled)
//        XCTAssertFalse(mockView.hideLoadingCalled)
//
//        // Create the presenter and attach the mock view
//        let presenter = YourPresenterClass()
//        presenter.attachView(mockView)
//
//        // Call the getAllFavorites() method on the presenter, which should trigger the view methods
//        presenter.getAllFavorites()
//
//        // Check if the view methods are called
//        XCTAssertTrue(mockView.reloadDataCalled)
//        XCTAssertTrue(mockView.showLoadingCalled)
//        XCTAssertTrue(mockView.hideLoadingCalled)
//
//        // Check if the fetched favorites match the sample data
//        XCTAssertEqual(presenter.numberOfItems(), 1)
//        XCTAssertEqual(presenter.getCollectionViewCellData(row: 0), favoriteModel)
//    }
//
    func testShowAlertParameter() {
        let mockView = MockFavouriteViewController()
        let presenter = FavouritePresenter(router: MockFavouriteRouter(), interactor: MockFavouriteInteractor(), view: mockView)
        
        // Test showAlert method
        mockView.showAlert("Test Title", "Test Message")
        
        XCTAssertTrue(mockView.showAlertCalled)
        XCTAssertEqual(mockView.alertTitle, "Test Title")
        XCTAssertEqual(mockView.alertMessage, "Test Message")
    }
    
    
    func testShowAlert() {
        mockView.showAlert("Test Title", "Test Message", buttonTitle: "OK", completion: nil)

        XCTAssertTrue(mockView.showAlertCalled)
        XCTAssertEqual(mockView.alertTitle, "Test Title")
        XCTAssertEqual(mockView.alertMessage, "Test Message")
        XCTAssertEqual(mockView.isButtonTitle, "OK")
        XCTAssertNil(mockView.isCompletion)
    }
    
}
