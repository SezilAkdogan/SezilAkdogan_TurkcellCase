//
//  DetailPresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation
import GamesAPI

// MARK: - PresenterInterface
protocol DetailPresenterInterface: PresenterInterface {
    func favouriteButtonTapped()
}

// MARK: - DetailPresenter
final class DetailPresenter {
    
    private let router: DetailRouterInterface
    private let interactor: DetailInteractorInterface
    private weak var view: DetailViewInterface?
    private var slug: String?
    private var gameDetailModel: GameDetailModel?
    private let coreDataManager: CoreDataManagerInterface
    private let notificationCenter: NotificationCenterProtocol?
    
    init(router: DetailRouterInterface,
         interactor: DetailInteractorInterface,
         view: DetailViewInterface?,
         slug: String?,
         coreDataManager: CoreDataManagerInterface = CoreDataManager.shared,
         notificationCenter: NotificationCenterProtocol = NotificationCenter.default) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.slug = slug
        self.coreDataManager = coreDataManager
        self.notificationCenter = notificationCenter
    }
    
    deinit {
        notificationCenter?.removeWith(self)
    }
}

// MARK: - DetailPresenterInterface
extension DetailPresenter: DetailPresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
        if let slug = slug {
            view?.showLoading()
            interactor.fetchGameDetails(slug: slug)
        }
    }
    
    func favouriteButtonTapped() {
        guard let model = gameDetailModel,
              let id = model.id else { return }

        if coreDataManager.isFavourite(gameID: id) {
            coreDataManager.removeGameFromFavourites(gameID: id)
        } else {
            coreDataManager.addGameToFavourites(gameCore: model)
        }

        view?.updateFavouriteButton(isFavourite: coreDataManager.isFavourite(gameID: id))
        notificationCenter?.post(with: .shouldUpdateFavourites, object: nil)
    }

}

// MARK: - DetailInteractorOutput
extension DetailPresenter: DetailInteractorOutput {
    func onFetchGames(_ result: Result<GameDetail, Error>) {
        view?.hideLoading()
        switch result {
        case .success(let response):
            let gameDetailModel: GameDetailModel = GameDetailModel(id: response.id,
                                                                   backgroundImage: response.backgroundImage,
                                                                   name: response.name,
                                                                   released: response.released,
                                                                   metacritic: "\(response.metacritic ?? 0)",
                                                                   description: response.description,
                                                                   ratings: response.rating,
                                                                   slug: response.slug
            )
            self.gameDetailModel = gameDetailModel
            
            if let id = gameDetailModel.id {
                view?.updateFavouriteButton(isFavourite: coreDataManager.isFavourite(gameID: id))
            }
            
            view?.updateView(with: gameDetailModel)
        case .failure(let error):
            view?.showAlert("Error", error.localizedDescription)
        }
    }
}
