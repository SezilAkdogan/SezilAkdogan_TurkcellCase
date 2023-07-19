//
//  FavouriteViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

private enum Constant {
    static let backgroundColor: UIColor = .clear
    
    enum FavouriteCollectionView {
        static let cellHeight: CGFloat = 100
    }
    
    enum EmptyLabel {
        static let text: String = "Looks like you do not have any favourite game."
        static let textColor: UIColor = .black
        static let font: UIFont = .systemFont(ofSize: 18, weight: .bold)
        static let numberOfLines: Int = 0
    }
    
    enum EmptyImage {
        static let image: UIImage = UIImage(named: "cryingEmoji")!
    }
}

// MARK: - ViewInterface
protocol FavouriteViewInterface: ViewInterface {
    func prepareUI()
    func reloadData()
    func updateEmptyView(with isHidden: Bool)
}

// MARK: - FavouriteViewController
final class FavouriteViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var emptyView: UIView!
    @IBOutlet private weak var emptyImageView: UIImageView!
    @IBOutlet private weak var emptyLabel: UILabel!
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
        prepareLabels()
        prepareViews()
        prepareImageViews()
    }
    
    func reloadData() {
        favouriteCollectionView.reloadData()
    }
    
    func updateEmptyView(with isHidden: Bool) {
        emptyView.isHidden = isHidden
    }

}

//MARK: - UICollectionViewDataSource
extension FavouriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellData = presenter.getCollectionViewCellData(row: indexPath.row) else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeCell(cellType: FavouriteCollectionViewCell.self, indexPath: indexPath)
        cell.configure(with: cellData)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension FavouriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(row: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavouriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: favouriteCollectionView.frame.width, height: Constant.FavouriteCollectionView.cellHeight)
    }
}

// MARK: - Prepares
private extension FavouriteViewController {
    func prepareCollectionView() {
        favouriteCollectionView.register(cellType: FavouriteCollectionViewCell.self)
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        favouriteCollectionView.showsVerticalScrollIndicator = false
        favouriteCollectionView.showsHorizontalScrollIndicator = false
        favouriteCollectionView.allowsMultipleSelection = false
        favouriteCollectionView.isPagingEnabled = true
    }
    
    func prepareLabels() {
        emptyLabel.text = Constant.EmptyLabel.text
        emptyLabel.textColor = Constant.EmptyLabel.textColor
        emptyLabel.font = Constant.EmptyLabel.font
    }
    
    func prepareImageViews() {
        emptyImageView.image = Constant.EmptyImage.image
    }
    
    func prepareViews() {
        emptyView.isHidden = true
    }
}
