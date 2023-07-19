//
//  HomeInteractor.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import Foundation
import GamesAPI

// MARK: - InteractorInterface
protocol HomeInteractorInterface: AnyObject {
    func fetchGames()
}

// MARK: - InteractorOutput
protocol HomeInteractorOutput: AnyObject {
    func onFetchGames(_ result: Result<Game, Error>)
}

// MARK: - HomeInteractor
final class HomeInteractor {
    weak var output: HomeInteractorOutput?
    
    private let videoGamesService: VideoGamesService

    init(videoGamesService: VideoGamesService = VideoGamesService()) {
        self.videoGamesService = videoGamesService
    }
}

// MARK: - HomeInteractorInterface
extension HomeInteractor: HomeInteractorInterface {
    func fetchGames() {
        videoGamesService.searchGame { [weak self] result in
            guard let self = self else { return }
            
            self.output?.onFetchGames(result)
        }
    }
}
