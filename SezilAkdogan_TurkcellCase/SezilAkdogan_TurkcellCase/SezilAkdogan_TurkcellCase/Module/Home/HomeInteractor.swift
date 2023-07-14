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
    func fetchGameDetails(slug: String)
}

// MARK: - InteractorOutput
protocol HomeInteractorOutput: AnyObject {
    func didFetchGames(_ games: Game)
    func didFailToFetchGames(with error: Error)
    func didFetchGameDetails(_ gameDetail: GameDetail)
    func didFailToFetchGameDetails(with error: Error)
}

// MARK: - HomeInteractor
final class HomeInteractor {
    weak var output: HomeInteractorOutput?
    weak var presenter: HomePresenterInterface?
    private let videoGamesService: VideoGamesService

    init(videoGamesService: VideoGamesService = VideoGamesService()) {
        self.videoGamesService = videoGamesService
    }
}

// MARK: - HomeInteractorInterface
extension HomeInteractor: HomeInteractorInterface {
    func fetchGames() {
        videoGamesService.searchGame { [weak self] result in
            switch result {
            case .success(let game):
                self?.output?.didFetchGames(game)
            case .failure(let error):
                self?.output?.didFailToFetchGames(with: error)
            }
        }
    }
    
    func fetchGameDetails(slug: String) {
        videoGamesService.gameDetail(slug) { [weak self] result in
            switch result {
            case .success(let gameDetail):
                self?.output?.didFetchGameDetails(gameDetail)
            case .failure(let error):
                self?.output?.didFailToFetchGameDetails(with: error)
            }
        }
    }
}
