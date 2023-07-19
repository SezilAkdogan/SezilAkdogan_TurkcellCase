//
//  MainTabBarInteractor.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 14.07.2023.
//

import Foundation

// MARK: - InteractorInterface

protocol MainInteractorInterface: InteractorInterface { }

// MARK: - MainInteractorOutput

protocol MainInteractorOutput: AnyObject { }

// MARK: - MainInteractor

final class MainInteractor {
    weak var output: MainInteractorOutput?
}

// MARK: - MainInteractorInterface
extension MainInteractor: MainInteractorInterface { }
