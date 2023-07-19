//
//  NoResultView.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 13.07.2023.
//

import UIKit

final class NoResultView: UIView {
    

    @IBOutlet private weak var emptyView: UIView!
    @IBOutlet private weak var emptyImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NoResultView", owner: self, options: nil)
        
        addSubview(emptyView)
        emptyView.frame = self.bounds
        
    }

}
