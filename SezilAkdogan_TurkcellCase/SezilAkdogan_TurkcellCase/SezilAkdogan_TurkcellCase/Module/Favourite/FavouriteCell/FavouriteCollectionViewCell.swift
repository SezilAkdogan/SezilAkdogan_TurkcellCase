//
//  FavouriteCollectionViewCell.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit
import SDWebImage

private enum Constant {
    enum FavourieNameLabel {
        static let favNameLabelFont: UIFont = .systemFont(ofSize: 15, weight: .heavy)
        static let favNameLabelColor: UIColor = .white
    }
    
    enum FavourieRelasedLabel {
        static let favRelasedLabelFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let favRelasedLabelColor: UIColor = .systemGray6
    }
    
    enum FavourieRatingLabel {
        static let favRatingLabelFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let favRatingLabelColor: UIColor = .systemGray6
    }
}

final class FavouriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var favoriteImage: UIImageView!
    @IBOutlet private weak var favoriteNameLabel: UILabel!
    @IBOutlet private weak var favoriteRelasedLabel: UILabel!
    @IBOutlet private weak var favoriteRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }
    
    func configure(with model: FavouriteModel) {
        if let favoriteImage = model.backgroundImage, let url = URL(string: favoriteImage) {
            self.favoriteImage.sd_setImage(with: url)
        }
        
        favoriteNameLabel.text = model.name
        favoriteRelasedLabel.text = model.released
        if let rating = model.rating {
            favoriteRatingLabel.text = String(rating)
        } else {
            favoriteRatingLabel.text = ""
        }
    }
   
}


// MARK: - Prepares
private extension FavouriteCollectionViewCell {
    func prepareUI() {
        prepareLabel()
        prepareImageView()
    }
    
    func prepareLabel() {
        favoriteNameLabel.textColor = Constant.FavourieNameLabel.favNameLabelColor
        favoriteNameLabel.font = Constant.FavourieNameLabel.favNameLabelFont
        
        favoriteRelasedLabel.textColor = Constant.FavourieRelasedLabel.favRelasedLabelColor
        favoriteRelasedLabel.font = Constant.FavourieRelasedLabel.favRelasedLabelFont
        
        favoriteRatingLabel.font = Constant.FavourieRatingLabel.favRatingLabelFont
        favoriteRatingLabel.textColor = Constant.FavourieRatingLabel.favRatingLabelColor
    }
    
    func prepareImageView() {
        favoriteImage.layer.cornerRadius = 18
    }
    
}
