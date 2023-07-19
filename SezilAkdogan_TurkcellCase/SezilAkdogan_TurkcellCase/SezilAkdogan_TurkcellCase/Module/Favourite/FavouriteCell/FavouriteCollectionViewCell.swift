//
//  FavouriteCollectionViewCell.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit
import SDWebImage

private enum Constant {
    static let backgroundColor: UIColor = .clear
    
    enum CoverImageView {
        static let cornerRadius: CGFloat = 18
    }
    
    enum NameLabel {
        static let font: UIFont = .systemFont(ofSize: 15, weight: .heavy)
        static let textColor: UIColor = .black
    }
    
    enum ReleasedLabel {
        static let font: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let textColor: UIColor = .black
    }
    
    enum RatingLabel {
        static let font: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let textColor: UIColor = .black
    }
}

final class FavouriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var releasedLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }
    
    func configure(with model: FavouriteModel) {
        
        if let backgroundImage = model.backgroundImage {
            coverImageView.sd_setImage(with: URL(string: backgroundImage))
        }
        
        if let nameText = model.nameText {
            nameLabel.text = nameText
        }
        
        if let releasedText = model.releasedText {
            releasedLabel.text = releasedText
        }
        
        if let rating = model.ratings {
            ratingLabel.text = String(format: "%.2f", rating)
        }
        
    }
   
}

// MARK: - Prepares
private extension FavouriteCollectionViewCell {
    func prepareUI() {
        backgroundColor = Constant.backgroundColor
        
        prepareLabels()
        prepareImageView()
    }
    
    func prepareLabels() {
        nameLabel.textColor = Constant.NameLabel.textColor
        nameLabel.font = Constant.NameLabel.font
        
        releasedLabel.textColor = Constant.ReleasedLabel.textColor
        releasedLabel.font = Constant.ReleasedLabel.font
        
        ratingLabel.font = Constant.RatingLabel.font
        ratingLabel.textColor = Constant.RatingLabel.textColor
    }
    
    func prepareImageView() {
        coverImageView.layer.cornerRadius = Constant.CoverImageView.cornerRadius
    }
    
}
