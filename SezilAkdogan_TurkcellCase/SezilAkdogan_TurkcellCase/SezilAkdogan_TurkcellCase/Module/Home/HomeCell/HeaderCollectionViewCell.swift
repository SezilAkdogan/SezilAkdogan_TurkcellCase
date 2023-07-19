//
//  HeaderCollectionViewCell.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit
import SDWebImage

private enum Constant {
    enum HomeHeaderImage {
        static let cornerRadius: CGFloat = 30
    }
}

final class HeaderCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var homeHeaderImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }
    
    func configure(with model: GamesModel) {
        if let homeHeaderImage = model.backgroundImage,
           let url = URL(string: homeHeaderImage) {
            self.homeHeaderImageView.sd_setImage(with: url)
        }
    }
}


// MARK: - Prepares

private extension HeaderCollectionViewCell {
    func prepareUI() {
        prepareImageViews()
    }
    
    func prepareImageViews() {
        homeHeaderImageView.layer.cornerRadius = Constant.HomeHeaderImage.cornerRadius
    }
}
