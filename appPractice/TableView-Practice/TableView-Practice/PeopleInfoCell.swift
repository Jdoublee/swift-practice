//
//  PeopleInfoCell.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/04/09.
//

import UIKit

class PeopleInfoCell: UICollectionViewCell {
    @IBOutlet var filmoLabel: UILabel!
    
    func update(filmo: String?) {
        filmoLabel?.text = " \(filmo!) " // 내부 마진 넣는 방법 찾기
        backgroundColor = .black
        filmoLabel.textAlignment = .center
        filmoLabel.textColor = .white
    }
}
