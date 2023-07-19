//
//  CoreDataManager.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 14.07.2023.
//

import UIKit
import CoreData

protocol CoreDataManagerInterface {
    func addGameToFavourites(gameCore: GameDetailModel)
    func isFavourite(gameID: Int) -> Bool
    func removeGameFromFavourites(gameID: Int)
    func getAllFavourites() -> [Favourite]
}

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

}

extension CoreDataManager: CoreDataManagerInterface {

    func addGameToFavourites(gameCore: GameDetailModel) {
        
        let newFavourite = Favourite(context: context)
    
        newFavourite.setValue(gameCore.name, forKey: "name")
        newFavourite.setValue(gameCore.id, forKey: "id")
        newFavourite.setValue(gameCore.released, forKey: "released")
        newFavourite.setValue(gameCore.backgroundImage, forKey: "backgroundImage")
        newFavourite.setValue(gameCore.metacritic, forKey: "metacritic")
        newFavourite.setValue(gameCore.description, forKey: "gameDescription")
        newFavourite.setValue(gameCore.ratings, forKey: "ratings")
        newFavourite.setValue(gameCore.slug, forKey: "slug")

        do {
            try context.save()
        } catch {
            print("\(error)")
        }
    }

    func isFavourite(gameID: Int) -> Bool {
        do {
            let fetchedResults = try context.fetch(Favourite.fetchRequest())
            return fetchedResults.contains(where: { $0.id == gameID })
        } catch {
            return false
        }
    }

    func removeGameFromFavourites(gameID: Int) {
        do {
            let fetchedResults = try context.fetch(Favourite.fetchRequest())
            fetchedResults.forEach { favourite in
                if favourite.id == gameID {
                    context.delete(favourite)
                }
            }
            save()
        } catch {
            print("Error: Can't get favourites - \(error)")
        }
    }
    
    func getAllFavourites() -> [Favourite] {
        do {
            let favourites = try context.fetch(Favourite.fetchRequest())
            return favourites
        } catch {
            return []
        }
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Failed to save Core Data context: \(error)")
            }
        }
    }
}
