//
//  HomePresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation
import GamesAPI

enum CollectionType {
    case header
    case list
}

// MARK: - PresenterInterface
protocol HomePresenterInterface: PresenterInterface {
    func viewDidLoad()
    func numberOfItems(collectionType: CollectionType) -> Int
    func getCollectionViewCellData(row: Int, collectionType: CollectionType) -> GamesModel?
    func didSelectItem(row: Int, collectionType: CollectionType)
    func searchBarTextDidChange(_ searchText: String)
}

// MARK: - HomePresenter
final class HomePresenter {
    
    private weak var view: HomeViewInterface?
    private let router: HomeRouterInterface
    private let interactor: HomeInteractorInterface
    
    var defaultHeaderModel: [GamesModel] = []
    var defaultListModel: [GamesModel] = []
    
    var headerModel: [GamesModel] = []
    var listModel: [GamesModel] = []
    
    var filteredGameModel: [GamesModel] = []
    var isFiltering: Bool = false
    
    init(
        router: HomeRouterInterface,
        interactor: HomeInteractorInterface,
        view: HomeViewInterface?
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
        view?.showLoading()
        interactor.fetchGames()
    }
    
    func numberOfItems(collectionType: CollectionType) -> Int {
        switch collectionType {
        case .header:
            return headerModel.count
        case .list:
            return listModel.count
        }
    }
    
    func getCollectionViewCellData(row: Int, collectionType: CollectionType) -> GamesModel? {
        switch collectionType {
        case .header:
            return headerModel[safe: row]
        case .list:
            return listModel[safe: row]
        }
    }
    
    func didSelectItem(row: Int, collectionType: CollectionType) {
        switch collectionType {
        case .header:
            guard let model = headerModel[safe: row] else { return }
            
            router.navigateToDetail(slug: model.slug)
        case .list:
            guard let model = listModel[safe: row] else { return }
            
            router.navigateToDetail(slug: model.slug)
        }
    }
    
    func searchBarTextDidChange(_ searchText: String) {
        if searchText.count >= 3 {
            filteredGameModel = listModel.filter { game in
                guard let name = game.name else {
                    return false
                }
                return name.lowercased().contains(searchText.lowercased())
                
            }
            if filteredGameModel.isEmpty {
                view?.showNoResultView(isHidden: false)
            } else {
                listModel = filteredGameModel
                view?.showHeaderView(isHidden: true)
                view?.showNoResultView(isHidden: true)
            }
        } else {
            filteredGameModel = []
            listModel = defaultListModel
            view?.showHeaderView(isHidden: false)
            view?.showNoResultView(isHidden: true)
        }
        view?.reloadListCollectionView()
    }

}

// MARK: - HomeInteractorOutput
extension HomePresenter: HomeInteractorOutput {
    func onFetchGames(_ result: Result<Game, Error>) {
        view?.hideLoading()
        switch result {
        case .success(let response):
            response.results?.forEach({ gameResult in
                let gameResult = GamesModel(id: gameResult.id,
                                            slug: gameResult.slug,
                                            name: gameResult.name,
                                            released: gameResult.released,
                                            backgroundImage: gameResult.backgroundImage,
                                            rating: gameResult.rating
                )
                
                if headerModel.count < 3 {
                    headerModel.append(gameResult)
                } else {
                    listModel.append(gameResult)
                }
            })
            
            defaultHeaderModel.append(contentsOf: headerModel)
            defaultListModel.append(contentsOf: listModel)
            
            view?.reloadHeaderCollectionView()
            view?.reloadListCollectionView()
        case .failure(let error):
            view?.showAlert("Error", error.localizedDescription)
        }
    }
}
