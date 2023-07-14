//
//  FavouriteRouter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

// MARK: - RouterInterface
protocol FavouriteRouterInterface { }

// MARK: - FavouriteRouter
final class FavouriteRouter {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UINavigationController {

        let interactor = FavouriteInteractor()
        let view = FavouriteViewController.instantiate()
        let navCon = UINavigationController(rootViewController: view)
        let router = FavouriteRouter(navigationController: navCon)
        let presenter = FavouritePresenter(router: router, interactor: interactor, view: view)
        view.presenter = presenter
        interactor.output = presenter
        
        return navCon
    }
}

// MARK: - FavouriteRouterInterface
extension FavouriteRouter: FavouriteRouterInterface { }
