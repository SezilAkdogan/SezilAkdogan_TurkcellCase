//
//  DetailRouter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

// MARK: - RouterInterface
protocol DetailRouterInterface: RouterInterface { }

// MARK: - DetailRouter
final class DetailRouter {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController?, slug: String?) -> UIViewController {

        let interactor = DetailInteractor()
        let view = DetailViewController.instantiate()
        let router = DetailRouter(navigationController: navigationController)
        let presenter = DetailPresenter(router: router, interactor: interactor, view: view, slug: slug)
        view.presenter = presenter
        interactor.output = presenter
        
        return view
    }
}

// MARK: - DetailRouterInterface
extension DetailRouter: DetailRouterInterface { }
