//
//  SplashPresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation

protocol SplashPresenterProtocol: PresenterInterface {
}

final class SplashPresenter {
    
    weak var view: SplashViewControllerProtocol?
    private let router: SplashRouterProtocol
    private let interactor: SplashInteractorProtocol
    private let monitorManager: MonitorManager
    
    init(
        view: SplashViewControllerProtocol,
        router: SplashRouterProtocol,
        interactor: SplashInteractorProtocol,
        monitorManager: MonitorManager = MonitorManager.shared
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.monitorManager = monitorManager
    }
    
}

extension SplashPresenter: SplashPresenterProtocol {
    func viewDidLoad() {
        interactor.checkInternetConnection()
    }
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    func internetConnectionStatus(_ status: Bool) {
        guard monitorManager.isReachable else {
            view?.showAlert("Error", "No internet Connection!")
            return
        }
        
        router.navigateToHome()
    }
}
