//
//  GameServices.swift
//  
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import Foundation
import Alamofire

// MARK: - VideoGamesService Protocol
public protocol VideoGamesServiceProtocol: AnyObject {
    func searchGame(completion: @escaping (Result<Game, Error>) -> Void)
    func gameDetail(_ word: String, completion: @escaping (Result<GameDetail, Error>) -> Void)
}

// MARK: - VideoGamesService
public class VideoGamesService: VideoGamesServiceProtocol {
    
    public init() {}
    
    public func searchGame(completion: @escaping (Result<Game, Error>) -> Void) {
        let url = "https://api.rawg.io/api/games?key=8676b21784d8456bbcd8e92d1908e2cb"
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let search = try decoder.decode(Game.self, from: data)
                    completion(.success(search))
                } catch {
                    print(error)
                    print("JSON DECODE ERROR")
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func gameDetail(_ slug: String, completion: @escaping (Result<GameDetail, Error>) -> Void) {
        let url = "https://api.rawg.io/api/games/\(slug)?key=8676b21784d8456bbcd8e92d1908e2cb"
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let gameDetail = try decoder.decode(GameDetail.self, from: data)
                    completion(.success(gameDetail))
                } catch {
                    print(error)
                    print("JSON DECODE ERROR")
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
