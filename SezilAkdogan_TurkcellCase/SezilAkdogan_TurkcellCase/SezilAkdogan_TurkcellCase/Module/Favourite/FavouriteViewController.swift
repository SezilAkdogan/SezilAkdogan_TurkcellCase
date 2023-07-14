//
//  FavouriteViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

// MARK: - Constant
private enum Constant {
    enum CollectionView {
        static let rowHeight: CGFloat = 90
    }
}

// MARK: - ViewInterface
protocol FavouriteViewInterface: ViewInterface {
    func prepareUI()
}

// MARK: - FavouriteViewController
final class FavouriteViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var favouriteCollectionView: UICollectionView!
    
    static var storyboardName: StoryboardNames {
        return .favourite
    }

    var presenter: FavouritePresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - FavouriteViewInterface
extension FavouriteViewController: FavouriteViewInterface {
    func prepareUI() {
       prepareCollectionView()

    }

}

//MARK: - UICollectionViewDataSource
extension FavouriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: FavouriteCollectionViewCell.self, indexPath: indexPath)
        //cell.configure(with: )
        return cell
    }

}

//MARK: - UICollectionViewDelegate
extension FavouriteViewController: UICollectionViewDelegate {

}



// MARK: - Prepares
private extension FavouriteViewController {
    func prepareCollectionView() {
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        favouriteCollectionView.register(cellType: FavouriteCollectionViewCell.self)
    }
}
