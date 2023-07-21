//
//  MockHomeRouter.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase


final class MockHomeRouter: HomeRouterInterface {
    
    var isInvokedNavigate = false
    var invokedNavigateCount = 0
    var receivedSlug: String?
    
    func navigateToDetail(slug: String?) {
        isInvokedNavigate = true
        invokedNavigateCount += 1
        receivedSlug = slug
    }
}
