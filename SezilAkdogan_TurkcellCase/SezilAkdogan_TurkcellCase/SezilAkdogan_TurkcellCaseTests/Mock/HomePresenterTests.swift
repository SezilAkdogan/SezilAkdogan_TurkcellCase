//
//  HomePresenterTests.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import XCTest
import GamesAPI
@testable import SezilAkdogan_TurkcellCase

final class HomePresenterTests: XCTestCase {
    
    var presenter: HomePresenter!
    var mockView: MockHomeViewController!
    var mockInteractor: MockHomeInteractor!
    var mockRouter: MockHomeRouter!
   
    override func setUp() {
        super.setUp()
        
        mockView = MockHomeViewController()
        mockRouter = MockHomeRouter()
        mockInteractor = MockHomeInteractor()
        presenter = HomePresenter(
            router: mockRouter,
            interactor: mockInteractor,
            view: mockView
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
        XCTAssertTrue(mockView.isUIPrepared)
        XCTAssertTrue(mockInteractor.isInvokedFetchGames)
        XCTAssertEqual(mockInteractor.invokedFetchGamesCount, 1)
    }
    
    func testNumberOfItems() {
        XCTAssertEqual(presenter.numberOfItems(collectionType: .header), 0)
        XCTAssertEqual(presenter.numberOfItems(collectionType: .list), 0)
        
        // Add some data to the presenter
        let gameModel = GamesModel(id: 1, slug: "game-slug", name: "Test Game", released: "2023-07-20", backgroundImage: nil, rating: nil)
        presenter.headerModel.append(gameModel)
        presenter.listModel.append(gameModel)
        
        XCTAssertEqual(presenter.numberOfItems(collectionType: .header), 1)
        XCTAssertEqual(presenter.numberOfItems(collectionType: .list), 1)
    }
    
    func testGetCollectionViewCellData() {
        // Add some data to the presenter
        let gameModel = GamesModel(id: 1, slug: "game-slug", name: "Test Game", released: "2023-07-20", backgroundImage: nil, rating: nil)
        presenter.headerModel.append(gameModel)
        presenter.listModel.append(gameModel)
        
        XCTAssertNotNil(presenter.getCollectionViewCellData(row: 0, collectionType: .header))
        XCTAssertNotNil(presenter.getCollectionViewCellData(row: 0, collectionType: .list))
        
        XCTAssertNil(presenter.getCollectionViewCellData(row: 1, collectionType: .header))
        XCTAssertNil(presenter.getCollectionViewCellData(row: 1, collectionType: .list))
    }
    
    
    func testDidSelectItem() {
        let mockRouter = MockHomeRouter()
        let presenter = HomePresenter(router: mockRouter, interactor: MockHomeInteractor(), view: MockHomeViewController())
        
        // Simulate some data in the presenter
        let gameModel = GamesModel(id: 1, slug: "game-slug", name: "Test Game", released: "2023-07-20", backgroundImage: nil, rating: nil)
        presenter.listModel = [gameModel]
        
        // Test didSelectItem for list collection view
        presenter.didSelectItem(row: 0, collectionType: .list)
        
        XCTAssertTrue(mockRouter.isInvokedNavigate)
        XCTAssertEqual(mockRouter.invokedNavigateCount, 1)
        XCTAssertEqual(mockRouter.receivedSlug, "game-slug")
    }
    
    func testSearchBarTextDidChange() {
        let mockView = MockHomeViewController()
        let presenter = HomePresenter(router: MockHomeRouter(), interactor: MockHomeInteractor(), view: mockView)
        
        // Simulate some data in the presenter
        let gameModel1 = GamesModel(id: 1, slug: "game-1", name: "Test Game 1", released: "2023-07-20", backgroundImage: nil, rating: nil)
        let gameModel2 = GamesModel(id: 2, slug: "game-2", name: "Test Game 2", released: "2023-07-20", backgroundImage: nil, rating: nil)
        presenter.defaultListModel = [gameModel1, gameModel2]
        presenter.listModel = presenter.defaultListModel
        
        // Test when searchText is empty
        presenter.searchBarTextDidChange("")
        XCTAssertEqual(presenter.listModel, presenter.defaultListModel)
        XCTAssertTrue(mockView.isNoResultViewHidden)
        
        // Test when searchText has less than 3 characters
        presenter.searchBarTextDidChange("Te")
        XCTAssertEqual(presenter.listModel, presenter.defaultListModel)
        XCTAssertFalse(mockView.isHeaderViewHidden)
        XCTAssertTrue(mockView.isNoResultViewHidden)
        
        // Test when searchText matches a game
        presenter.searchBarTextDidChange("Test Game 1")
        XCTAssertEqual(presenter.listModel.count, 1)
        XCTAssertTrue(mockView.isHeaderViewHidden)
        XCTAssertTrue(mockView.isNoResultViewHidden)
        
        // Test when searchText doesn't match any game
        presenter.searchBarTextDidChange("Non-Existent Game")
        XCTAssertTrue(mockView.isHeaderViewHidden)
        XCTAssertFalse(mockView.isNoResultViewHidden)
    }
    
    func testShowAlertParameter() {
        let mockView = MockHomeViewController()
        let presenter = HomePresenter(router: MockHomeRouter(), interactor: MockHomeInteractor(), view: mockView)
        
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


extension Game {
    
    static var response: Game {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "Games", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let response = try! JSONDecoder().decode(Game.self, from: data)
        return response
    }
    
}

extension GamesModel: Equatable {
    public static func == (lhs: GamesModel, rhs: GamesModel) -> Bool {
        return lhs.id == rhs.id &&
               lhs.slug == rhs.slug &&
               lhs.name == rhs.name &&
               lhs.released == rhs.released &&
               lhs.backgroundImage == rhs.backgroundImage &&
               lhs.rating == rhs.rating
    }
}
