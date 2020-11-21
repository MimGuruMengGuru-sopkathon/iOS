//
//  DetailVC.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/21.
//

import UIKit

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var MemeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MemeCollectionView.delegate = self
        MemeCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension DetailVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
        
    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top:13, left:16, bottom: 0, right: 16)
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}

extension DetailVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemeCVCell.identifier, for: indexPath) as? MemeCVCell else {
            return UICollectionViewCell()
        }
        cell.setImage(imageName:"scribble" )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MemeCVHeader", for: indexPath)
            return headerView
        default:
            assert(false, "응 아니야") } }
    
    
}
