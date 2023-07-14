//
//  DetailRouter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

// MARK: - RouterInterface
protocol DetailRouterInterface { }

// MARK: - DetailRouter
final class DetailRouter {
    private weak var presenter: DetailPresenter?
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController?, gameDetailModel: GameDetailModel) -> UIViewController {

        let interactor = DetailInteractor()
        let view = DetailViewController.instantiate()
        let router = DetailRouter(navigationController: navigationController)
        let presenter = DetailPresenter(router: router, interactor: interactor, view: view, gameDetailModel: gameDetailModel)
        router.presenter = presenter
        view.presenter = presenter
        interactor.output = presenter
        
        return view
    }
}

// MARK: - DetailRouterInterface
extension DetailRouter: DetailRouterInterface { }

