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
        XCTAssertTrue(mockView.showLoadingCalled)
        XCTAssertTrue(mockView.hideLoadingCalled)
        XCTAssertTrue(mockView.updateEmptyViewCalled)
        XCTAssertTrue(mockView.reloadDataCalled)
        XCTAssertTrue(mockCoreDataManager.stubbedFavorites.isEmpty)
    }
    
    func testViewWillAppear() {
        presenter.viewWillAppear()
        
        XCTAssertTrue(mockCoreDataManager.stubbedFavorites.isEmpty)
    }
    
    func testNumberOfItems() {
        let testFavorites: [Favourite] = []
        mockCoreDataManager.stubbedFavorites = testFavorites
        presenter.fetchFavourites()
        
        XCTAssertEqual(presenter.numberOfItems(), testFavorites.count)
    }
    
    func testGetCollectionViewCellData() {
        let testFavorites: [Favourite] = []
        mockCoreDataManager.stubbedFavorites = testFavorites
        presenter.fetchFavourites()
        
        for (index, favorite) in testFavorites.enumerated() {
            let favoriteModel = presenter.getCollectionViewCellData(row: index)
            XCTAssertEqual(favoriteModel?.nameText, favorite.name)
            XCTAssertEqual(favoriteModel?.releasedText, favorite.released)
            
        }
    }
    
    func testDidSelectItem() {
        let testFavorites: [Favourite] = []
        mockCoreDataManager.stubbedFavorites = testFavorites
        presenter.fetchFavourites()
        
        for (index, _) in testFavorites.enumerated() {
            presenter.didSelectItem(row: index)
            XCTAssertTrue(mockRouter.isInvokedNavigate)
            XCTAssertEqual(mockRouter.invokedNavigateCount, index + 1)
            XCTAssertEqual(mockRouter.receivedSlug, testFavorites[index].slug)
        }
    }
    
    func testFetchFavourites() {
       
        presenter.viewDidLoad()
        XCTAssertTrue(mockView.reloadDataCalled)
        XCTAssertTrue(mockView.updateEmptyViewCalled)
        XCTAssertEqual(mockView.isHiddenValue, false)
    }

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
