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
    func viewDidLoad()
    func numberOfItems() -> Int
}

// MARK: - FavouritePresenter
final class FavouritePresenter {

    private let router: FavouriteRouterInterface
    private let interactor: FavouriteInteractorInterface
    private weak var view: FavouriteViewInterface?

    init(router: FavouriteRouterInterface, interactor: FavouriteInteractorInterface, view: FavouriteViewInterface?) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
}

// MARK: - FavouritePresenterInterface
extension FavouritePresenter: FavouritePresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
    }
    
    func numberOfItems() -> Int {
        return 1
    }
   
}

// MARK: - FavouriteInteractorOutput
extension FavouritePresenter: FavouriteInteractorOutput {
    
}
