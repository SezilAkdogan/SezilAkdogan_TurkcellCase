//
//  HomeViewController.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import UIKit

// MARK: - Constant
private enum Constant {
    static let backgroundColor: UIColor = .white
    
    static var title: String = "Video Games"
    
    static var noResultViewFrame: CGRect {
        return CGRect(x: 0, y: 141, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    enum PageControl {
        static let backgroundColor: UIColor = .clear
        static let activeColor: UIColor = .black.withAlphaComponent(0.8)
        static let passiveColor: UIColor = .gray
        static let cornerRadus: CGFloat = 8
        static let initialPagesCount: Int = 0
    }
}

// MARK: - ViewInterface
protocol HomeViewInterface: ViewInterface {
    func prepareUI()
    func reloadHeaderCollectionView()
    func reloadListCollectionView()
    func showNoResultView(isHidden: Bool)
    func showHeaderView(isHidden: Bool)
}

// MARK: - HomeViewController
final class HomeViewController: UIViewController, Storyboarded {
    @IBOutlet private weak var headerCollectionView: UICollectionView!
    @IBOutlet private weak var listCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var pageView: UIView!
    

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
        headerCollectionView.reloadData()
        updatePageControl()
    }
    
    func reloadListCollectionView() {
        listCollectionView.reloadData()
    }
    
    func showNoResultView(isHidden: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.noResultView.isHidden = isHidden
        }
    }
    
    func showHeaderView(isHidden: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.headerView.isHidden = isHidden
            self?.pageView.isHidden = isHidden
        }
    }
    
    func prepareUI() {
        view.backgroundColor = Constant.backgroundColor
        prepareNavigationController()
        prepareCollectionView()
        prepareSarchBar()
        preparePageControl()
        prepareNoResultView()
    }
    
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems(collectionType: collectionView == headerCollectionView ? .header : .list)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            guard let cellData = presenter.getCollectionViewCellData(row: indexPath.row, collectionType: .header) else {
                return UICollectionViewCell()
            }
            
            let cell = collectionView.dequeCell(cellType: HeaderCollectionViewCell.self, indexPath: indexPath)
            cell.configure(with: cellData)
            return cell
        } else {
            guard let cellData = presenter.getCollectionViewCellData(row: indexPath.row, collectionType: .list) else {
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
        
        if collectionView == headerCollectionView {
            return collectionView.frame.size
        } else {
            return CGSize(width: collectionView.frame.width, height: 70)
        }
    }
    
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(row: indexPath.row, collectionType: collectionView == headerCollectionView ? .header : .list)
    }
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        guard let currentRow = headerCollectionView.collectionViewLayout.currentCenteredPage else {
            return
        }
        pageControl.currentPage = currentRow
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
    func prepareNavigationController() {
        title = Constant.title
        
        //navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    func  prepareCollectionView(){
        headerCollectionView.register(cellType: HeaderCollectionViewCell.self)
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        headerCollectionView.showsVerticalScrollIndicator = false
        headerCollectionView.showsHorizontalScrollIndicator = false
        headerCollectionView.allowsMultipleSelection = false
        headerCollectionView.isPagingEnabled = true
       
        listCollectionView.register(cellType: ListCollectionViewCell.self)
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.showsVerticalScrollIndicator = false
        listCollectionView.showsHorizontalScrollIndicator = false
        listCollectionView.allowsMultipleSelection = false
        listCollectionView.isPagingEnabled = false
    }
    
    func prepareSarchBar() {
        searchBar.delegate = self
        searchBar.searchTextField.backgroundColor = .darkGray
        searchBar.searchTextField.leftView?.tintColor = .systemGray4
        searchBar.searchTextField.textColor = .white
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray4])
    }
    
    func preparePageControl() {
        pageControl.numberOfPages = Constant.PageControl.initialPagesCount
        pageControl.hidesForSinglePage = true
        pageControl.backgroundColor = Constant.PageControl.backgroundColor
        pageControl.pageIndicatorTintColor = Constant.PageControl.passiveColor
        pageControl.currentPageIndicatorTintColor = Constant.PageControl.activeColor
        pageControl.layer.cornerRadius = Constant.PageControl.cornerRadus
        pageControl.clipsToBounds = true
    }
    
    func prepareNoResultView() {
        let noResultView = NoResultView(frame: Constant.noResultViewFrame)
        noResultView.backgroundColor = .red
        noResultView.isHidden = true
        view.insertSubview(noResultView, belowSubview: searchBar)
        self.noResultView = noResultView
    }
}

// MARK: - Helper

private extension HomeViewController {
    func updatePageControl() {
        pageControl.numberOfPages = presenter.numberOfItems(collectionType: .header)
    }
}
