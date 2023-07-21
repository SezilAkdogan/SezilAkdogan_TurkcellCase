//
//  DetailPresenterTests.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import XCTest
import GamesAPI
@testable import SezilAkdogan_TurkcellCase

final class DetailPresenterTests: XCTestCase {
    
    var presenter: DetailPresenter!
    var mockView: MockDetailViewController!
    var mockInteractor: MockDetailInteractor!
    var mockRouter: MockDetailRouter!
    
    override func setUp() {
        super.setUp()
        
        mockView = MockDetailViewController()
        mockRouter = MockDetailRouter()
        mockInteractor = MockDetailInteractor()
        presenter = DetailPresenter(
            router: mockRouter,
            interactor: mockInteractor,
            view: mockView,
            slug: "testSlug"
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
        // Simulate viewDidLoad() being called
        presenter.viewDidLoad()
        
        // Check if prepareUI() is called on the view
        XCTAssertTrue(mockView.isInvokedPrepareUI)
        
        // Check if fetchGameDetails() is called on the interactor
        XCTAssertTrue(mockInteractor.isInvokedFetchGameDetails)
        XCTAssertEqual(mockInteractor.invokedFetchGameDetailsCount, 1)
        
        // Check if showLoading() is called on the view
        XCTAssertTrue(mockView.isInvokedShowLoading)
    }
    
    // Test updateFavouriteButton(isFavourite:)
    func testUpdateFavouriteButton() {
        // Check initial state
        XCTAssertFalse(mockView.isInvokedUpdateFavouriteButton)
        XCTAssertEqual(mockView.invokedUpdateFavouriteButtonCount, 0)
        
        // Call updateFavouriteButton(isFavourite:) with true
        mockView.updateFavouriteButton(isFavourite: true)
        
        // Check if updateFavouriteButton(isFavourite:) is called on the view
        XCTAssertTrue(mockView.isInvokedUpdateFavouriteButton)
        XCTAssertEqual(mockView.invokedUpdateFavouriteButtonCount, 1)
        
        // Call updateFavouriteButton(isFavourite:) with false
        mockView.updateFavouriteButton(isFavourite: false)
        
        // Check if updateFavouriteButton(isFavourite:) is called on the view again
        XCTAssertTrue(mockView.isInvokedUpdateFavouriteButton)
        XCTAssertEqual(mockView.invokedUpdateFavouriteButtonCount, 2)
    }
    
    
    func testShowAlert() {
        let mockView = MockDetailViewController()
        let presenter = DetailPresenter(router: MockDetailRouter(), interactor: MockDetailInteractor(), view: mockView, slug: "testSlug")
        
        // Test showAlert method
        mockView.showAlert("Test Title", "Test Message")
        
        XCTAssertTrue(mockView.showAlertCalled)
        XCTAssertEqual(mockView.invokedShowAlertCount, 1)
        XCTAssertEqual(mockView.alertTitle, "Test Title")
        XCTAssertEqual(mockView.alertMessage, "Test Message")
    }

    
}

extension GameDetail {
    
    static var response: GameDetail {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "GameDetail", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let response = try! JSONDecoder().decode(GameDetail.self, from: data)
        return response
    }
    
}
