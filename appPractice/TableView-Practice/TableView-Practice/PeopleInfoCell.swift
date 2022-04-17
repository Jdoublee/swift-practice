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
        filmoLabel?.text = filmo! // 내부 마진 넣는 방법 찾기 -> 아래 클래스 생성 완
        backgroundColor = .black
        filmoLabel.textAlignment = .center
        filmoLabel.textColor = .white
    }
}

class paddingLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 6.0
    @IBInspectable var bottomInset: CGFloat = 6.0
    @IBInspectable var leftInset: CGFloat = 6.0
    @IBInspectable var rightInset: CGFloat = 6.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset, height: size.height + topInset + bottomInset)
    }
}
