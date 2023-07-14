//
//  SplashRouter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

protocol SplashRouterProtocol {
    func navigateToHome()
}

final class SplashRouter {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UINavigationController {
        let view = SplashViewController.instantiate()
        let interactor = SplashInteractor()
        let navCon = UINavigationController(rootViewController: view)
        let router = SplashRouter(navigationController: navCon)
        let presenter = SplashPresenter(
            view: view,
            router: router,
            interactor: interactor
        )
        view.presenter = presenter
        interactor.output = presenter
        return navCon
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func navigateToHome() {
        let homeVC = HomeRouter.createModule(with: navigationController)
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
