//
//  DetailPresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation

// MARK: - PresenterInterface
protocol DetailPresenterInterface: PresenterInterface {
}

// MARK: - DetailPresenter
final class DetailPresenter {
    
    private let router: DetailRouterInterface
    private let interactor: DetailInteractorInterface
    private weak var view: DetailViewInterface?
    private var gameDetailModel: GameDetailModel
    
    init(router: DetailRouterInterface,
         interactor: DetailInteractorInterface,
         view: DetailViewInterface?,
         gameDetailModel: GameDetailModel) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.gameDetailModel = gameDetailModel
    }
}

// MARK: - DetailPresenterInterface
extension DetailPresenter: DetailPresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
    }
}

// MARK: - DetailInteractorOutput
extension DetailPresenter: DetailInteractorOutput { }

