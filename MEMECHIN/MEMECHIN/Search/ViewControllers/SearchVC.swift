//
//  SearchVC.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/21.
//

import UIKit

class SearchVC: UIViewController {
    
    var SearchModel: Search?
    
    @IBOutlet weak var searchLogo: UIImageView!
    @IBOutlet weak var profileLogo: UIImageView!
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
 
    @IBAction func goAction(_ sender: Any) {
        let board = UIStoryboard(name: "Detail", bundle: nil)
               
               guard let dvc = board.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else {
                   return
               }
        dvc.modalPresentationStyle = .fullScreen
               self.present(dvc, animated: true)
        
           }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        setPlaceHolder()
        getSearch()
    }
    
    func setPlaceHolder() {
        searchTextField.placeholder = "# 밈 키워드를 검색해보세요"
        searchTextField.borderStyle = .roundedRect
        searchTextField.layer.cornerRadius = 3.5
        searchLogo.image = UIImage(named: "appLogo")
        profileLogo.image = UIImage(named: "icMypage")
        
        
    }
}

extension SearchVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
       
        
        
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let SearchImage = ["result1","result2","result3","result4","result5", "result6","result8","IMG_8233"]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                SearchCell.identifier, for: indexPath) as? SearchCell else {
            return UICollectionViewCell()
        }
        
        cell.searchImage.image = UIImage(named: SearchImage[indexPath.row])
        cell.go.setTitle(" ", for: .normal)

        
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

extension SearchVC {
    func getSearch(){
        SearchService.shared.searchloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! Search
                self.SearchModel = response
                self.searchCollectionView.reloadData()
                self.searchCollectionView.dataSource = self
                self.searchCollectionView.delegate = self
                
                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
    }
}
