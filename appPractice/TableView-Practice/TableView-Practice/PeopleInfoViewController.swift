//
//  PeopleInfoViewController.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/03/29.
//

import UIKit

class PeopleInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var peopleName: UILabel!
    
    var pvo: PeopleVO!
    
    var filmoList = [String]()
    
    override func viewDidLoad() {
        self.peopleName.text = pvo.peopleNm
        seperateFilmoNames()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! PeopleInfoCell
        
        cell.update(filmo: filmoList[indexPath.item])
        // 둥글게
        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.blue.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tmpLabel : UILabel = UILabel()
        tmpLabel.text = filmoList[indexPath.item]
        // Dynamic cell sizing
        return CGSize(width: tmpLabel.intrinsicContentSize.width, height: 35) // 라벨 텍스트 길이만큼의 너비 반환 (height는 일단 고정)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // 상하좌우 마진
    }
    
    func seperateFilmoNames() {
        let seperatedList = self.pvo.filmoNames!.split(separator: "|")
        
        for sep in seperatedList {
            filmoList.append(String(sep))
        }
    }
}
