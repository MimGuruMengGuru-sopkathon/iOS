//
//  TodayMemeCell.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/22.
//

import UIKit

class TodayMemeCell: UICollectionViewCell {
    static let identifier = "TodayMemeCell"

    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var todayImageView: UIImageView!
    
    
    var todayCornerRadius: CGFloat {
        set(newValue) {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
            self.layer.maskedCorners = [.layerMaxXMinYCorner]
        } get { return self.layer.cornerRadius }
    }
    
    func setTodayData(todayImageName: String){
        self.todayImageView.image = UIImage(named: todayImageName)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TodayMemeCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

class RoundView: UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set(newValue) {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
            self.layer.maskedCorners = [.layerMaxXMinYCorner]
        } get { return self.layer.cornerRadius }
        
    }
    
}


