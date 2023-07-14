//
//  FavouriteInteractor.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation

// MARK: - InteractorInterface
protocol FavouriteInteractorInterface {
    
}

// MARK: - InteractorOutput
protocol FavouriteInteractorOutput: AnyObject {
    
}

// MARK: - FavouriteInteractor
final class FavouriteInteractor {
    weak var output: FavouriteInteractorOutput?
}

// MARK: - FavouriteInteractorInterface
extension FavouriteInteractor: FavouriteInteractorInterface {
    
}
