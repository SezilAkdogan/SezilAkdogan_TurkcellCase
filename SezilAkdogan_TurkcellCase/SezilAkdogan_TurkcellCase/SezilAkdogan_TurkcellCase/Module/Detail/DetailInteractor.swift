//
//  DetailInteractor.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation
import GamesAPI

// MARK: - InteractorInterface
protocol DetailInteractorInterface: InteractorInterface {
    func fetchGameDetails(slug: String)
}

// MARK: - InteractorOutput
protocol DetailInteractorOutput: AnyObject {
    func onFetchGames(_ result: Result<GameDetail, Error>)
}

// MARK: - DetailInteractor
final class DetailInteractor {
    weak var output: DetailInteractorOutput?
    private let videoGamesService: VideoGamesService
    
    init(videoGamesService: VideoGamesService = VideoGamesService()) {
        self.videoGamesService = videoGamesService
    }
}

// MARK: - DetailInteractorInterface
extension DetailInteractor: DetailInteractorInterface {
    func fetchGameDetails(slug: String) {
        videoGamesService.gameDetail(slug) { [weak self] result in
            guard let self = self else { return }
            
            self.output?.onFetchGames(result)
        }
    }
}
