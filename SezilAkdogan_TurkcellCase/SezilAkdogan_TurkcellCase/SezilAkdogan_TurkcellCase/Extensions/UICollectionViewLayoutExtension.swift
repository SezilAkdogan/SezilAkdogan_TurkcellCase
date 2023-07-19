//
//  UICollectionViewLayoutExtension.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 17.07.2023.
//

import UIKit

extension UICollectionViewLayout {
    public var currentCenteredPage: Int? {
        guard let collectionView = collectionView else { return nil }
        let currentCenteredPoint = CGPoint(x: collectionView.contentOffset.x + collectionView.bounds.width / 2, y: collectionView.contentOffset.y + collectionView.bounds.height / 2)
        
        return collectionView.indexPathForItem(at: currentCenteredPoint)?.row
    }
}
