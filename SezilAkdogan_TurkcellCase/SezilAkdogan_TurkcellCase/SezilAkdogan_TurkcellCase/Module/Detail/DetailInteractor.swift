//
//  DetailInteractor.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation
import GamesAPI

// MARK: - InteractorInterface
protocol DetailInteractorInterface { }

// MARK: - InteractorOutput
protocol DetailInteractorOutput: AnyObject { }

// MARK: - DetailInteractor
final class DetailInteractor {
    weak var output: DetailInteractorOutput?
}

// MARK: - DetailInteractorInterface
extension DetailInteractor: DetailInteractorInterface { }
