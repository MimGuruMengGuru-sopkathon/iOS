//
//  MemeCVCell.swift
//  MEMECHIN
//
//  Created by 이윤진 on 2020/11/22.
//

import UIKit

class MemeCVCell: UICollectionViewCell {
    
    @IBOutlet weak var MemeImageView: UIImageView!
    static let identifier = "MemeCVCell"
    
    //더미
    func setImage(imageName: String){
        MemeImageView.image = UIImage(systemName: imageName)
    }
}
