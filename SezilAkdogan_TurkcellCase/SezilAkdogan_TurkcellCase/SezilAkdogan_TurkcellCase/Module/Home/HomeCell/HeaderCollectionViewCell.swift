//
//  HeaderCollectionViewCell.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit
import SDWebImage

final class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var homeHeaderImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }
    
    func configure(with model: GamesModel) {
        if let homeHeaderImage = model.backgroundImage,
           let url = URL(string: homeHeaderImage) {
            self.homeHeaderImage.sd_setImage(with: url)
        }
        
    }

}


// MARK: - Prepares

private extension HeaderCollectionViewCell {
    func prepareUI() {
        prepareImageView()
    }
    func prepareImageView() {
        homeHeaderImage.layer.cornerRadius = 15
    }
}
