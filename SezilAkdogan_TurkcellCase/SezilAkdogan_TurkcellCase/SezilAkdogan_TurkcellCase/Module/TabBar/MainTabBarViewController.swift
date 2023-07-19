//
//  MainTabBarViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 14.07.2023.
//

import UIKit

// MARK: - Constant

private enum Constant {
    static let backgroundColor: UIColor = .white
    
    enum TabBar {
        static let tintColor: UIColor = .black
        static let unselectedItemTintColor: UIColor = .gray
        static let lineColor: UIColor = .gray.withAlphaComponent(0.5)
        static let lineHeight: CGFloat = 1
    }
}

// MARK: - ViewInterface

protocol MainViewInterface: ViewInterface {
    func prepareUI()
    func display(_ viewControllers: [UIViewController], with currentIndex: Int)
}

// MARK: - MainViewController

final class MainViewController: UITabBarController {

    var presenter: MainPresenterInterface! {
        didSet {
            presenter.viewDidLoad()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - MainViewInterface

extension MainViewController: MainViewInterface {
    func prepareUI() {
        view.backgroundColor = Constant.backgroundColor
        navigationController?.setNavigationBarHidden(true, animated: true)

        prepareTabBar()
    }
    
    func display(_ viewControllers: [UIViewController], with currentIndex: Int) {
        self.viewControllers = viewControllers
        selectedViewController = viewControllers[currentIndex]
    }
}

// MARK: - Prepares

private extension MainViewController {
    func prepareTabBar() {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: Constant.TabBar.lineHeight))
        lineView.backgroundColor = Constant.TabBar.lineColor
        tabBar.addSubview(lineView)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = Constant.TabBar.tintColor
        tabBar.unselectedItemTintColor = Constant.TabBar.unselectedItemTintColor
    }
}
