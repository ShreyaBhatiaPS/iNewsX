//
//  NewsViewController.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 04/07/22.
//

import UIKit

class NewsViewController: UIViewController {
    
    var viewModel: INewsViewModel?
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAccessibilityIdentifier()
        self.fetchNewsData()
    }

    private func fetchNewsData() {
        viewModel?.fetchNews()
    }
    
    private func addAccessibilityIdentifier() {
        newsCollectionView.accessibilityIdentifier = "NewsCollectionView"
    }
}

extension NewsViewController: NewsViewModelResult {
    
    func success() {
        newsCollectionView.reloadData()
    }
    
    func gotError(_ error: BaseErrorClass) {
        self.presentAlert(title: "", message: error.message)
    }
}

extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.news.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.newsData = viewModel?.news[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-32, height: 800)
    }

}

extension NewsViewController: UIScrollViewDelegate {
    
    private func snapToCenter() {
        let centerPoint = view.convert(view.center, to: newsCollectionView)
        guard let centerIndexPath = newsCollectionView.indexPathForItem(at: centerPoint) else {
            return
        }
        newsCollectionView.scrollToItem(at: centerIndexPath, at: .centeredVertically, animated: true)
     }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        snapToCenter()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            snapToCenter()
        }
    }
}
