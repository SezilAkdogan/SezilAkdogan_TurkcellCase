//
//  MainTabBarRouter.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 14.07.2023.
//

import UIKit

// MARK: - Constant

private enum Constant {
    struct TabBarItem {
        static let titleFont: UIFont = .systemFont(ofSize: 12, weight: .bold)
        static let selectedTitleColor: UIColor = .black
        static let unSelectedTitleColor: UIColor = .gray
        
        static let homeTabImage: UIImage = UIImage(systemName: "house")!
        static let homeTitle: String = "Home"
        static let favouriteTabImage: UIImage = UIImage(systemName: "heart")!
        static let favouriteTitle: String = "Favourite"
    }
}

// MARK: - RouterInterface

protocol MainRouterInterface: RouterInterface {
    func getViewControllers() -> [UINavigationController]
}

// MARK: - MainRouter

final class MainRouter {
    private weak var presenter: MainPresenter?
    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(tabType: TabType = .home) -> UIViewController {

        let interactor = MainInteractor()
        let view = MainViewController()
        let navCon = UINavigationController(rootViewController: view)
        navCon.modalPresentationStyle = .fullScreen
        let router = MainRouter(navigationController: navCon)
        let presenter = MainPresenter(router: router, interactor: interactor, view: view, tabType: tabType)
        router.presenter = presenter
        view.presenter = presenter
        interactor.output = presenter
        presenter.setupViewControllers()
        return navCon
    }
}

// MARK: - MainRouterInterface

extension MainRouter: MainRouterInterface {
    func getViewControllers() -> [UINavigationController] {
        let selectedTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Constant.TabBarItem.selectedTitleColor,
            NSAttributedString.Key.font: Constant.TabBarItem.titleFont
        ]
        
        let unselectedTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Constant.TabBarItem.unSelectedTitleColor,
            NSAttributedString.Key.font: Constant.TabBarItem.titleFont
        ]

        let homeView = HomeRouter.createModule()
        homeView.tabBarItem.title = Constant.TabBarItem.homeTitle
        homeView.tabBarItem?.image = Constant.TabBarItem.homeTabImage
        homeView.tabBarItem?.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)
        homeView.tabBarItem?.setTitleTextAttributes(unselectedTitleTextAttributes, for: .normal)
        
        let favouriteView = FavouriteRouter.createModule()
        favouriteView.tabBarItem.title = Constant.TabBarItem.favouriteTitle
        favouriteView.tabBarItem?.image = Constant.TabBarItem.favouriteTabImage
        favouriteView.tabBarItem?.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)
        favouriteView.tabBarItem?.setTitleTextAttributes(unselectedTitleTextAttributes, for: .normal)
        
        return [
            homeView,
            favouriteView
        ]
    }
}
