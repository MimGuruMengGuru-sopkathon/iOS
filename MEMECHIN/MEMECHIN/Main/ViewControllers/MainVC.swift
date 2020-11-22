//
//  MainVC.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var todayCollectionView: UICollectionView!
    @IBOutlet weak var basicTopCollectionView: UICollectionView!
    @IBOutlet weak var basicBotCollectionView: UICollectionView!
    @IBOutlet weak var searchBtn: UIButton!
    
    
    var today : [Today] = []
    var basictop : [BasicTop] = []
    var basicbot : [BasicBot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setToday()
        todayCollectionView.register(TodayMemeCell.nib(), forCellWithReuseIdentifier: TodayMemeCell.identifier)
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        setBT()
        basicTopCollectionView.register(BasicTopCell.nib(), forCellWithReuseIdentifier: BasicTopCell.identifier)
        basicTopCollectionView.delegate = self
        basicTopCollectionView.dataSource = self
        
        setBB()
        basicBotCollectionView.register(BasicBotCell.nib(), forCellWithReuseIdentifier: BasicBotCell.identifier)
        basicBotCollectionView.delegate = self
        basicBotCollectionView.dataSource = self
    }
    
    @IBAction func touchUpSearch(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC else {
            return}
        dvc.modalPresentationStyle = .fullScreen

        present(dvc, animated: true, completion: nil)
        
    }
    //MARK: - Data Setting
    func setToday() {
        today.append(contentsOf: [
            Today(todayImageName: "box1"),
            Today(todayImageName: "box2"),
            Today(todayImageName: "box3"),
            Today(todayImageName: "box4"),
        ])
    }
    
    func setBT() {
        basictop.append(contentsOf: [
            BasicTop(basicTopImageName: "result6", basicTopCategory: "# 회사짤"),
            BasicTop(basicTopImageName: "result2", basicTopCategory: "# 시험짤"),
            BasicTop(basicTopImageName: "result3", basicTopCategory: "# 회사짤"),
            BasicTop(basicTopImageName: "result4", basicTopCategory: "# 회사짤"),
            
        ])
    }
        
    func setBB() {
            basicbot.append(contentsOf: [
                BasicBot(basicBotImageName: "result5"),
                BasicBot(basicBotImageName: "result1"),
                BasicBot(basicBotImageName: "result7"),
                BasicBot(basicBotImageName: "result8"),
                BasicBot(basicBotImageName: "picture"),
                
            ])
    }
}


extension MainVC: UICollectionViewDelegate {
    
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.todayCollectionView {
            return today.count
        }else if collectionView == self.basicTopCollectionView {
            return basictop.count
        }else if collectionView == self.basicBotCollectionView {
            return basicbot.count
        }else { return 0}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.todayCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayMemeCell.identifier, for: indexPath) as? TodayMemeCell else {
                return UICollectionViewCell()
            }
            
            cell.setTodayData(todayImageName: today[indexPath.row].todayImageName)
            return cell
        }else if collectionView == self.basicTopCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicTopCell.identifier, for: indexPath) as? BasicTopCell else {
                return UICollectionViewCell()
            }
            
            cell.setBTopData(basicTopImageName: basictop[indexPath.row].basicTopImageName, basicTopCategory: basictop[indexPath.row].basicTopCategory)
            return cell
        }else if collectionView == self.basicBotCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicBotCell.identifier, for: indexPath) as? BasicBotCell else {
                return UICollectionViewCell()
            }
            
            cell.setBBotData(basicBotImageName: basicbot[indexPath.row].basicBotImageName, basicBotCategory: "")
            return cell
        }else{
            return UICollectionViewCell()
        }
        
    }
    
    
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
            {
                if collectionView == self.todayCollectionView{
                    return CGSize(width: 223, height: 218)
                }else if collectionView == self.basicTopCollectionView{
                    return CGSize(width: 140, height: 140)
                }else if collectionView == self.basicBotCollectionView{
                    return CGSize(width: 140, height: 140)
                }else{
                    return CGSize(width: 0, height: 0)
                }
            }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
        {
                if collectionView == self.todayCollectionView{
                    return 20
                }else if collectionView == self.basicTopCollectionView{
                    return 16
                }else if collectionView == self.basicBotCollectionView{
                    return 16
                }else{
                    return 0
                }
        }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
        {
                
                if collectionView == self.todayCollectionView{
                    return UIEdgeInsets(top: (collectionView.frame.height-218)/2, left: 16, bottom: (collectionView.frame.height-218)/2, right: 0)
                }else if collectionView == self.basicTopCollectionView{
                    return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 0)
                }else if collectionView == self.basicBotCollectionView{
                    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0)
                }else{
                    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                
        }
    
    }

