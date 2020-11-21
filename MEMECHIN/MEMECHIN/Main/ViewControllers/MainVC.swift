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
    @IBOutlet weak var todayPageControl: UIPageControl!
    @IBOutlet weak var mainSearchBar: UISearchBar!
    
    
    var today : [Today] = []
    var basictop : [BasicTop] = []
    var basicbot : [BasicBot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainSearchBar.placeholder = "# 밈 키워드를 입력해보세요"
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
    
    //MARK: - Data Setting
    func setToday() {
        today.append(contentsOf: [
            Today(todayImageName: "homeCard"),
            Today(todayImageName: "homeCard"),
            Today(todayImageName: "homeCard"),
            Today(todayImageName: "homeCard"),
            Today(todayImageName: "homeCard"),
        ])
    }
    
    func setBT() {
        basictop.append(contentsOf: [
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            BasicTop(basicTopImageName: "homeCard", basicTopCategory: "Category"),
            
        ])
    }
        
    func setBB() {
            basicbot.append(contentsOf: [
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                BasicBot(basicBotImageName: "homeCard", basicBotCategory: "Category"),
                
            ])
    }
}


extension MainVC: UICollectionViewDelegate {
    
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.todayCollectionView {
            return 5
        }else if collectionView == self.basicTopCollectionView {
            return 8
        }else if collectionView == self.basicBotCollectionView {
            return 8
        }else { return 0}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.todayCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayMemeCell.identifier, for: indexPath) as? TodayMemeCell else {
                return UICollectionViewCell()
            }
            
            cell.setTodayData(todayImageName: today[indexPath.row].todayImageName)
//            cell.setTodayData(todayImageName: today[indexPath.row])
            return cell
        }else if collectionView == self.basicTopCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicTopCell.identifier, for: indexPath) as? BasicTopCell else {
                return UICollectionViewCell()
            }
            
            cell.setBTopData(basicTopImageName: basictop[indexPath.item].basicTopImageName, basicTopCategory: basictop[indexPath.item].basicTopCategory)
            return cell
        }else if collectionView == self.basicBotCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicBotCell.identifier, for: indexPath) as? BasicBotCell else {
                return UICollectionViewCell()
            }
            
            cell.setBBopData(basicBotImageName: basicbot[indexPath.row].basicBotImageName, basicBotCategory: basicbot[indexPath.row].basicBotCategory)
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
                    return UIEdgeInsets(top: 15, left: 16, bottom: 57, right: 0)
                }else if collectionView == self.basicTopCollectionView{
                    return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 0)
                }else if collectionView == self.basicBotCollectionView{
                    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0)
                }else{
                    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                
        }
    
    }

