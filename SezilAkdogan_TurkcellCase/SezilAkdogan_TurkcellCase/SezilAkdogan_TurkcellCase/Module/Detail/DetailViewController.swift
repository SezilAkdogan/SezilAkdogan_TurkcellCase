//
//  DetailViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import UIKit

// MARK: - Constant
private enum Constant {
    enum TitleLabel {
        static let font: UIFont = .systemFont(ofSize: 20, weight: .heavy)
        static let textColor: UIColor = .black
    }
    
    enum ReleaseDateLabel {
        static let font: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let textColor: UIColor = .black
    }
    
    enum DetailMetacriticLabel {
        static let font: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let textColor: UIColor = .black
    }
    
    enum FavouriteButton {
        static let emptyHeartImage: UIImage = UIImage(systemName: "heart")!.withRenderingMode(.alwaysOriginal)
        static let fillHeartImage: UIImage = UIImage(systemName: "heart.fill")!.withRenderingMode(.alwaysOriginal)
    }
    
    enum DescriptionTextView {
        static let font: UIFont = .systemFont(ofSize: 18, weight: .semibold)
        static let textColor: UIColor = .black
    }
}

// MARK: - ViewInterface
protocol DetailViewInterface: ViewInterface {
    func prepareUI()
    func updateView(with gameDetailModel: GameDetailModel)
    func updateFavouriteButton(isFavourite: Bool)
}

// MARK: - DetailViewController
final class DetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var detailMetacriticLabel: UILabel!
    @IBOutlet private weak var favouriteButton: UIButton!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    static var storyboardName: StoryboardNames {
        return .detail
    }
    
    var presenter: DetailPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

// MARK: - DetailViewInterface
extension DetailViewController: DetailViewInterface {
    func prepareUI() {
        prepareLabels()
        prepareButtons()
    }
    
    func updateView(with gameDetailModel: GameDetailModel) {
        coverImageView.sd_setImage(with: URL(string: gameDetailModel.backgroundImage ?? ""))
        titleLabel.text = gameDetailModel.name
        releaseDateLabel.text = gameDetailModel.released
        detailMetacriticLabel.text = gameDetailModel.metacritic
        if let description = gameDetailModel.description {
            let attributedDescription = description.htmlAttributedString(
                font: Constant.DescriptionTextView.font,
                fontSize: 16
                //textColor: Constant.DescriptionTextView.textColor
            )
            descriptionTextView.attributedText = attributedDescription
        } else {
            descriptionTextView.attributedText = nil
        }
    }

    func updateFavouriteButton(isFavourite: Bool) {
        let image = isFavourite ? Constant.FavouriteButton.fillHeartImage : Constant.FavouriteButton.emptyHeartImage
        favouriteButton.setImage(image, for: .normal)
    }
}

// MARK: - Prepares
private extension DetailViewController {
    func prepareLabels() {
        titleLabel.font = Constant.TitleLabel.font
        titleLabel.textColor = Constant.TitleLabel.textColor
        
        releaseDateLabel.font = Constant.ReleaseDateLabel.font
        releaseDateLabel.textColor = Constant.ReleaseDateLabel.textColor
        
        detailMetacriticLabel.font = Constant.DetailMetacriticLabel.font
        detailMetacriticLabel.textColor = Constant.DetailMetacriticLabel.textColor
    }
    
    func prepareTextViews() {
        descriptionTextView.textColor = Constant.DescriptionTextView.textColor
        descriptionTextView.font = Constant.DescriptionTextView.font
    }
    
    func prepareButtons() {
        favouriteButton.setImage(Constant.FavouriteButton.emptyHeartImage, for: .normal)
        favouriteButton.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
  }
    
}

// MARK: - Actions
@objc
private extension DetailViewController {
    func favouriteButtonTapped() {
        presenter.favouriteButtonTapped()
    }
}
