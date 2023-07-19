//
//  SplashRouter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

protocol SplashRouterInterface {
    func navigateToMain()
}

final class SplashRouter {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UINavigationController {

        let interactor = SplashInteractor()
        let view = SplashViewController.instantiate()
        let navCon = UINavigationController(rootViewController: view)
        navCon.modalPresentationStyle = .fullScreen
        let router = SplashRouter(navigationController: navCon)
        let presenter = SplashPresenter(router: router, interactor: interactor, view: view)
        view.presenter = presenter
        interactor.output = presenter
        
        return navCon
    }
}

extension SplashRouter: SplashRouterInterface {
    
    func navigateToMain() {
        let window = UIApplication.shared.keyWindow
        let mainView = MainRouter.createModule()
        window?.switchRootViewController(to: mainView)
    }
}
