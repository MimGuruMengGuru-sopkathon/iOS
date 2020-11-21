//
//  SearchCell.swift
//  MEMECHIN
//
//  Created by 최영재 on 2020/11/22.
//

import UIKit

class SearchCell: UICollectionViewCell {
    static let identifier = "SearchCell"
    
    @IBOutlet weak var searchImage: UIImageView!
    
    func setImg(){
        searchImage.layer.cornerRadius = 7.5
    }
}
