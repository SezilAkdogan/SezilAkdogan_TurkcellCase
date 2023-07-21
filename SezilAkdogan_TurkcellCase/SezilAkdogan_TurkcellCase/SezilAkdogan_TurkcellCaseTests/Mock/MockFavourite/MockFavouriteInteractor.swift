//
//  MockFavouriteInteractor.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockFavouriteInteractor: FavouriteInteractorInterface {
    weak var output: FavouriteInteractorOutput?
}
