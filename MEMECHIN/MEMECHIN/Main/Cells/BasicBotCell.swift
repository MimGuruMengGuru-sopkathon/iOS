//
//  BasicBotCell.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/22.
//

import UIKit

class BasicBotCell: UICollectionViewCell {
    static let identifier = "BasicBotCell"
    
    @IBOutlet weak var basicBotImageView: UIImageView!
    
    func setBBotData(basicBotImageName: String, basicBotCategory: String){
        self.basicBotImageView.image = UIImage(named: basicBotImageName)

    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BasicBotCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
