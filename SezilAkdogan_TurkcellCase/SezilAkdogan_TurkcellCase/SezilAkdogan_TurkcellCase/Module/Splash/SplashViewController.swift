//
//  SplashViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

protocol SplashViewControllerProtocol: ViewInterface { }

final class SplashViewController: UIViewController, Storyboarded {
    
    static var storyboardName: StoryboardNames {
        return .splash
    }

    var presenter: SplashPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension SplashViewController: SplashViewControllerProtocol { }
