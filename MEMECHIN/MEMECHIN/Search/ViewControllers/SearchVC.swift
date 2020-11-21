//
//  SearchVC.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/21.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        
    }
    
    func setPlaceHolder() {
        searchTextField.placeholder = "# 밈 키워드를 검색해보세요e"
        searchTextField.borderStyle = .roundedRect
        searchTextField.layer.cornerRadius = 3.5
    }
}

extension SearchVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                SearchCell.identifier, for: indexPath) as? SearchCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
extension SearchVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.searchCollectionView.frame.width - 13) / 2
        let height =  width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
    }
}
