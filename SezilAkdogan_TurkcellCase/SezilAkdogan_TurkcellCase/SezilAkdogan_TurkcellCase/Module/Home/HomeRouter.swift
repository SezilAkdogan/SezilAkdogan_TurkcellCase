//
//  HomeRouter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

// MARK: - RouterInterface
protocol HomeRouterInterface {
    func navigateToDetail(gameResult: GameDetailModel)
    func navigateToFavourite()
}

// MARK: - HomeRouter
final class HomeRouter {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(with navigationController: UINavigationController?) -> UIViewController {

        let interactor = HomeInteractor()
        let view = HomeViewController.instantiate()
        let router = HomeRouter(navigationController: navigationController)
        let presenter = HomePresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        interactor.output = presenter as any HomeInteractorOutput
        
        return view
    }
}

// MARK: - HomeRouterInterface
extension HomeRouter: HomeRouterInterface {
    func navigateToDetail(gameResult: GameDetailModel) {
        let view = DetailRouter.createModule(navigationController: navigationController, gameDetailModel: gameResult)
        navigationController?.pushViewController(view, animated: true)
    }
    
    func navigateToFavourite() {
        let view = FavouriteRouter.createModule()
        navigationController?.present(view, animated: true)
    }
}
