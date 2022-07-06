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
        self.fetchNewsData()
    }

    private func fetchNewsData() {
        viewModel?.fetchNews()
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

extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    

}
