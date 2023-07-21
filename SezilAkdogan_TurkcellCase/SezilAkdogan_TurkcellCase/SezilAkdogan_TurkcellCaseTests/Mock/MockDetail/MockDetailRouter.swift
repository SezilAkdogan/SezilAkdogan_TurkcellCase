//
//  MockDetailRouter.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockDetailRouter: DetailRouterInterface {
    
    var isInvokedNavigate = false
    var invokedNavigateCount = 0
    
}
