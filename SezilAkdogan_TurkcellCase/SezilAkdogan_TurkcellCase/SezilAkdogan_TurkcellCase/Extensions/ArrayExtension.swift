//
//  ArrayExtension.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 17.07.2023.
//

import Foundation

extension Array {
    /// Safe way to get an item from specific index.
    /// Works with O(1) complexity since *count* check is O(1) in an array.
    /// - Parameter index: Given index.
    subscript (safe index: Index) -> Element? {
        return (0 <= index && index < count) ? self[index] : nil
    }
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
