//
//  FavouritePresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation
import CoreData

// MARK: - PresenterInterface
protocol FavouritePresenterInterface: PresenterInterface {
    func numberOfItems() -> Int
    func getCollectionViewCellData(row: Int) -> FavouriteModel?
    func didSelectItem(row: Int)
}

// MARK: - FavouritePresenter
final class FavouritePresenter {

    private let router: FavouriteRouterInterface
    private let interactor: FavouriteInteractorInterface
    private weak var view: FavouriteViewInterface?
    private var favourites: [FavouriteModel] = []
    private let coreDataManager: CoreDataManagerInterface
    private let notificationCenter: NotificationCenterProtocol

    init(router: FavouriteRouterInterface,
         interactor: FavouriteInteractorInterface,
         view: FavouriteViewInterface?,
         coreDataManager: CoreDataManagerInterface = CoreDataManager.shared,
         notificationCenter: NotificationCenterProtocol = NotificationCenter.default) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.coreDataManager = coreDataManager
        self.notificationCenter = notificationCenter
    }
    
}

// MARK: - FavouritePresenterInterface
extension FavouritePresenter: FavouritePresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
        fetchFavourites()
        
        notificationCenter.add(observer: self,
                               selector: #selector(shouldUpdateFavourites),
                               name: .shouldUpdateFavourites,
                               object: nil)
    }
    
    func viewWillAppear() {
        fetchFavourites()
    }
    
    func numberOfItems() -> Int {
        favourites.count
    }
    
    func getCollectionViewCellData(row: Int) -> FavouriteModel? {
        favourites[safe: row]
    }
    
    func didSelectItem(row: Int) {
        router.navigateToDetail(slug: favourites[safe: row]?.slug)
    }
}

// MARK: - FavouriteInteractorOutput
extension FavouritePresenter: FavouriteInteractorOutput {

}

// MARK: - Helper
extension FavouritePresenter {
    func fetchFavourites() {
        view?.showLoading()
        favourites.removeAll()
        favourites = coreDataManager.getAllFavourites().map { favourite in
            return FavouriteModel(nameText: favourite.name,
                                  releasedText: favourite.released,
                                  backgroundImage: favourite.backgroundImage,
                                  ratings: favourite.ratings,
                                  slug: favourite.slug)
        }
        view?.hideLoading()
        view?.updateEmptyView(with: !favourites.isEmpty)
        view?.reloadData()
    }
}

// MARK: - Actions
@objc
private extension FavouritePresenter {
    func shouldUpdateFavourites() {
        fetchFavourites()
    }
}
