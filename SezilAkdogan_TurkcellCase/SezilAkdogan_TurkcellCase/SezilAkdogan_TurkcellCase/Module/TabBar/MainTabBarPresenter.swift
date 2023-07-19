//
//  MainTabBarPresenter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 14.07.2023.
//

import Foundation

// MARK: - PresenterInterface

protocol MainPresenterInterface: PresenterInterface {
    func setupViewControllers()
}

// MARK: - MainPresenter

final class MainPresenter {
    private let router: MainRouterInterface
    private let interactor: MainInteractorInterface
    private weak var view: MainViewInterface?
    private let tabType: TabType

    init(router: MainRouterInterface, interactor: MainInteractorInterface, view: MainViewInterface?, tabType: TabType) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.tabType = tabType
    }
}

// MARK: - MainPresenterInterface

extension MainPresenter: MainPresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
    }

    func setupViewControllers() {
        let controllers = router.getViewControllers()
        view?.display(controllers, with: tabType.rawValue)
    }
}

// MARK: - MainInteractorOutput

extension MainPresenter: MainInteractorOutput { }
