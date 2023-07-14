//
//  DetailViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import UIKit

// MARK: - Constant
private enum Constant {
    enum DetailNameLabel {
        static let detailNameLabellFont: UIFont = .systemFont(ofSize: 15, weight: .heavy)
        static let detailNameLabelColor: UIColor = .white
    }
    
    enum DetailReleaseLabel {
        static let detailReleaseLabelFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let detailReleaseLabellColor: UIColor = .systemGray6
    }
    
    enum DetailMetacriticLabel {
        static let detailMetacriticLabelFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let detailMetacriticLabelColor: UIColor = .systemGray6
    }
    
    enum CoreDataFavButton {
        static let image: UIImage = UIImage(systemName: "heart")!.withRenderingMode(.alwaysOriginal)
    }
    
}

// MARK: - ViewInterface
protocol DetailViewInterface: ViewInterface {
    func prepareUI()
}

// MARK: - DetailViewController
final class DetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailReleaseLabel: UILabel!
    @IBOutlet weak var detailMetacriticLabel: UILabel!
    @IBOutlet weak var favCoreButton: UIButton!
    @IBOutlet weak var descriptionText: UITextView!
    
    static var storyboardName: StoryboardNames {
        return .detail
    }
    
    var presenter: DetailPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        prepareView()
    }
    
}

// MARK: - DetailViewInterface
extension DetailViewController: DetailViewInterface {
    
    func prepareUI() {
        
    }
    
}

// MARK: - Prepares
private extension DetailViewController {
    func prepareView() {
        prepareConstant()
        prepareButtons()
    }
    
    func prepareConstant() {
        detailNameLabel.textColor = Constant.DetailNameLabel.detailNameLabelColor
        detailNameLabel.font = Constant.DetailNameLabel.detailNameLabellFont
        
        detailReleaseLabel.textColor = Constant.DetailReleaseLabel.detailReleaseLabellColor
        detailReleaseLabel.font = Constant.DetailReleaseLabel.detailReleaseLabelFont
        
        detailMetacriticLabel.font = Constant.DetailMetacriticLabel.detailMetacriticLabelFont
        detailMetacriticLabel.textColor = Constant.DetailMetacriticLabel.detailMetacriticLabelColor
    }
    
    func prepareButtons() {
      favCoreButton.setImage(Constant.CoreDataFavButton.image, for: .normal)
      favCoreButton.addTarget(self, action: #selector(coreDataFavButtonTapped), for: .touchUpInside)
  }
    
}

// MARK: - Actions
@objc
private extension DetailViewController {
    
    func coreDataFavButtonTapped() {
        
    }
}
