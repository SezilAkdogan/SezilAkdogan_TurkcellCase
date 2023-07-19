//
//  SplashInteractor.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation

protocol SplashInteractorInterface { }

protocol SplashInteractorOutput: AnyObject { }

final class SplashInteractor {
    weak var output: SplashInteractorOutput?
}

extension SplashInteractor: SplashInteractorInterface {
    
}
