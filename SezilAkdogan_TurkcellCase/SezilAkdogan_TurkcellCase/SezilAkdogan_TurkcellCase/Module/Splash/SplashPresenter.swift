//
//  SplashPresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation

protocol SplashPresenterInterface: PresenterInterface { }

final class SplashPresenter {
    
    weak var view: SplashViewInterface?
    private let router: SplashRouterInterface
    private let interactor: SplashInteractorInterface
    private let monitorManager: MonitorManager
    
    init(router: SplashRouterInterface,
         interactor: SplashInteractorInterface,
         view: SplashViewInterface,
         monitorManager: MonitorManager = MonitorManager.shared) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.monitorManager = monitorManager
    }
    
}

// MARK: - SplashPresenterInterface
extension SplashPresenter: SplashPresenterInterface {
    func viewDidLoad() {
        checkInternetConnection()
    }
}

// MARK: - SplashInteractorOutput
extension SplashPresenter: SplashInteractorOutput { }

// MARK: - Helper
private extension SplashPresenter {
    func checkInternetConnection() {
        guard monitorManager.isReachable else {
            view?.showAlert("No Internet", "You dont have Internet", buttonTitle: "Try Again" , completion: { [weak self] in
                guard let self else { return }
                
                self.checkInternetConnection()
            })
            return
        }
        
        router.navigateToMain()
    }
}
