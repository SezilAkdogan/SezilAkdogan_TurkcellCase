//
//  HomeViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import UIKit

// MARK: - Constant
private enum Constant {
    static var title: NSAttributedString {
        return NSAttributedString(string: "Video Games", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    static var noResultViewFrame: CGRect {
        return CGRect(x: 0, y: 141, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
}

// MARK: - ViewInterface
protocol HomeViewInterface: ViewInterface {
    func prepareUI()
    func reloadHeaderCollectionView()
    func reloadListCollectionView()
    func showNoResultView()
    func hideNoResultView()
}

// MARK: - HomeViewController
final class HomeViewController: UIViewController, Storyboarded {
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var searchBar: UISearchBar!

    static var storyboardName: StoryboardNames {
        return .home
    }
    
    var presenter: HomePresenterInterface!
    var noResultView: NoResultView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - HomeViewInterface
extension HomeViewController: HomeViewInterface {
    func reloadHeaderCollectionView() {
        DispatchQueue.main.async { [weak self] in
            self?.headerCollectionView.reloadData()
        }
    }
    
    func reloadListCollectionView() {
        DispatchQueue.main.async { [weak self] in
            self?.listCollectionView.reloadData()
        }
    }
    
    func showNoResultView() {
        DispatchQueue.main.async { [weak self] in
                if self?.noResultView == nil {
                    self?.noResultView = NoResultView(frame: Constant.noResultViewFrame)
                    self?.view.addSubview((self?.noResultView)!)
                } else {
                    self?.noResultView.isHidden = false
                }
            }
    }
    
    func hideNoResultView() {
        DispatchQueue.main.async { [weak self] in
            self?.noResultView?.isHidden = true
        }
    }
    
    func prepareUI() {
        prepareCollectionView()
        prepareSarchBar()
        prepareNavigationController()
    }
    
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            guard let cellData = presenter.getHeaderCollectionViewCellData(with: indexPath.row) else {
                return UICollectionViewCell()
            }
            let cell = collectionView.dequeCell(cellType: HeaderCollectionViewCell.self, indexPath: indexPath)
            cell.configure(with: cellData)
            return cell
        } else {
            guard let cellData = presenter.getListCollectionViewCellData(with: indexPath.row) else {
                return UICollectionViewCell()
            }
            
            let cell = collectionView.dequeCell(cellType: ListCollectionViewCell.self, indexPath: indexPath)
            cell.configure(with: cellData)
            return cell
        }
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Move this CGSize to the Constant.
        return CGSize(width: 300, height: 60)
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == listCollectionView {
            presenter.didSelectItem(at: indexPath)
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            presenter.searchBarTextDidChange(searchText)
        }
}


// MARK: - Prepares
extension HomeViewController {
    
    func  prepareCollectionView(){
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        headerCollectionView.register(cellType: HeaderCollectionViewCell.self)
        
        listCollectionView.delegate = self
        listCollectionView.register(cellType: ListCollectionViewCell.self)
        listCollectionView.dataSource = self
        
    }
    
    func prepareSarchBar() {
        searchBar.delegate = self
        searchBar.searchTextField.backgroundColor = .darkGray
        searchBar.searchTextField.leftView?.tintColor = .systemGray4
        searchBar.searchTextField.textColor = .white
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray4])
    }
    
    func prepareNavigationController() {
        let title = Constant.title
        
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
