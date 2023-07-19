//
//  String+Extension.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 14.07.2023.
//

import UIKit

extension String {
    func htmlAttributedString(font: UIFont? = nil, fontSize: CGFloat? = nil) -> NSAttributedString? {
        var text = self
        if let font = font {
            var style = "font-family: \(font.familyName);"
            if let fontSize = fontSize {
                style += " font-size: \(fontSize)px;"
            }
            text = String(format: "<span style=\"%@\">%@</span>", style, self)
        }
        
        guard let data = text.data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
}
