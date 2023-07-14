//
//  HomePresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation
import GamesAPI

// MARK: - PresenterInterface
protocol HomePresenterInterface: PresenterInterface {
    func viewDidLoad()
    func numberOfItems(in section: Int) -> Int
    func configureHeaderCell( cell: HeaderCollectionViewCell, at indexPath: IndexPath)
    func getHeaderCollectionViewCellData(with index: Int) -> GamesModel?
    func getListCollectionViewCellData(with index: Int) -> GamesModel?
    func didSelectItem(at indexPath: IndexPath)
    func searchBarTextDidChange(_ searchText: String)
}

// MARK: - HomePresenter
final class HomePresenter {
    
    private weak var view: HomeViewInterface?
    private let router: HomeRouterInterface
    private let interactor: HomeInteractorInterface
    
    var gameModel: [GamesModel] = []
    var filteredGameModel: [GamesModel] = []
    var isFiltering: Bool = false
    
    init(
        view: HomeViewInterface?,
        router: HomeRouterInterface,
        interactor: HomeInteractorInterface
    ) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}

// MARK: - HomePresenterInterface
extension HomePresenter: HomePresenterInterface {
    
    func viewDidLoad() {
        view?.prepareUI()
        interactor.fetchGames()
    }
    
    func numberOfItems(in section: Int) -> Int {
//        if section == 0 {
//            return 3
//        } else {
//            return isFiltering ? filteredGameModel.count : gameModel.count
//        }
        return gameModel.count
    }
    
    func configureHeaderCell(cell: HeaderCollectionViewCell, at indexPath: IndexPath) {
//        let topGames = gameModel.prefix(3)
//        let game = topGames[indexPath.row]
//        cell.configure(with: game)
    }
    
    func getHeaderCollectionViewCellData(with index: Int) -> GamesModel? {
        return gameModel[safe: index]
    }
    
    
    func getListCollectionViewCellData(with index: Int) -> GamesModel? {
        return gameModel[safe: index]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let game = isFiltering ? filteredGameModel[indexPath.row] : gameModel[indexPath.row]
        guard let slug = game.slug else { return }
        interactor.fetchGameDetails(slug: slug)
    }
    
    func searchBarTextDidChange(_ searchText: String) {
        if searchText.count >= 3 {
            filteredGameModel = gameModel.filter { game in
                guard let name = game.name else {
                    return false
                }
                return name.lowercased().contains(searchText.lowercased())
            }
            if filteredGameModel.isEmpty {
                view?.showNoResultView()
            } else {
                view?.hideNoResultView()
            }
        } else {
            filteredGameModel = []
            view?.hideNoResultView()
        }
        view?.reloadListCollectionView()
    }

}

// MARK: - HomeInteractorOutput
extension HomePresenter: HomeInteractorOutput {
    func didFetchGames(_ games: Game) {
        let gameModel = games.results?.compactMap({ gameResult in
            let gameResult = GamesModel(id: gameResult.id,
                                        slug: gameResult.slug,
                                        name: gameResult.name,
                                        released: gameResult.released,
                                        backgroundImage: gameResult.backgroundImage,
                                        rating: gameResult.rating
            )
            return gameResult
        })
        self.gameModel.removeAll()
        self.gameModel = gameModel ?? []
        view?.reloadListCollectionView()
    }
    
    func didFailToFetchGames(with error: Error) {
        
    }
    
    func didFetchGameDetails(_ gameDetail: GameDetail) {
//        router.navigateToDetail(gameModel: gameModel[row])
    }
    
    func didFailToFetchGameDetails(with error: Error) {
        
    }
}


extension Array {
    /// Safe way to get an item from specific index.
    /// Works with O(1) complexity since *count* check is O(1) in an array.
    /// - Parameter index: Given index.
    subscript (safe index: Index) -> Element? {
        return (0 <= index && index < count) ? self[index] : nil
    }
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
