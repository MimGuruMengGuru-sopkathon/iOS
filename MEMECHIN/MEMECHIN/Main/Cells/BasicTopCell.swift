//
//  BasicCell.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/22.
//

import UIKit

class BasicTopCell: UICollectionViewCell {
    static let identifier = "BasicTopCell"
    
    @IBOutlet weak var basicImageView: UIImageView!
    @IBOutlet weak var basicHeartBtn: UIButton!
    @IBOutlet weak var basicHashTagLabel: UILabel!
    
    func setBTopData(basicTopImageName: String, basicTopCategory: String){
        self.basicImageView.image = UIImage(named: basicTopImageName)
        self.basicHashTagLabel.text = basicTopCategory
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BasicTopCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
