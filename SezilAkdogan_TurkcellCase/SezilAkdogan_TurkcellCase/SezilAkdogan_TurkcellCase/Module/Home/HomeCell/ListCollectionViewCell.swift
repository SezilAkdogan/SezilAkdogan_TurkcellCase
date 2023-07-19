//
//  ListCollectionViewCell.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit
import SDWebImage

// MARK: - Constant
private enum Constant {
    enum HomeListImageView {
        static let cornerRadius: CGFloat = 10
    }
    enum HomeNameLabel {
        static let homeNameLabelFont: UIFont = .systemFont(ofSize: 15, weight: .heavy)
        static let homeNameLabelColor: UIColor = .black
    }
    
    enum RelasedLabel {
        static let relasedLabelFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let relasedLabelColor: UIColor = .black
    }
    
    enum RatingLabel {
        static let ratingLabelFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let ratingLabelColor: UIColor = .black
    }
}

final class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var homeListImageView: UIImageView!
    
    @IBOutlet private weak var homeNameLabel: UILabel!
    
    @IBOutlet private weak var relasedLabel: UILabel!
    
    @IBOutlet private weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }
    
    func configure(with model: GamesModel) {
        if let homeListImage = model.backgroundImage,
            let url = URL(string: homeListImage) {
            self.homeListImageView.sd_setImage(with: url)
        }

        homeNameLabel.text = model.name
        relasedLabel.text = model.released
       
        if let rating = model.rating {
            ratingLabel.text = String(rating)
        } else {
            ratingLabel.text = ""
        }
    }

}

// MARK: - Prepares
private extension ListCollectionViewCell {
    func prepareUI() {
        prepareLabel()
    }
    
    func prepareLabel() {
        homeNameLabel.textColor = Constant.HomeNameLabel.homeNameLabelColor
        homeNameLabel.font = Constant.HomeNameLabel.homeNameLabelFont
        
        relasedLabel.textColor = Constant.RelasedLabel.relasedLabelColor
        relasedLabel.font = Constant.RelasedLabel.relasedLabelFont
        
        ratingLabel.font = Constant.RatingLabel.ratingLabelFont
        ratingLabel.textColor = Constant.RatingLabel.ratingLabelColor
    }
    
    func prepareImageViews() {
        homeListImageView.layer.cornerRadius = Constant.HomeListImageView.cornerRadius
    }
}
