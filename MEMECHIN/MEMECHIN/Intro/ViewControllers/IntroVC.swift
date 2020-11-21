//
//  IntroVC.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/21.
//

import UIKit

class IntroVC: UIViewController {

    @IBOutlet weak var angryBtn: UIButton!
    @IBOutlet weak var happyBtn: UIButton!
    @IBOutlet weak var workBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn2IsSelected(_ sender: Any) {
        
        angryBtn.setImage(UIImage(named: "btnBox2Pick"),for: .normal)
    }
    
    @IBAction func btn3IsSelected(_ sender: Any) {
        
        happyBtn.setImage(UIImage(named: "btnBox3Pick"), for: .normal)
    }
    @IBAction func btn6IsSelected(_ sender: Any) {
        workBtn.setImage(UIImage(named: "btnBox6Pick"), for: .normal)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
