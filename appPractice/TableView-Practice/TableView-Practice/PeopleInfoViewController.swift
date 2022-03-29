//
//  PeopleInfoViewController.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/03/29.
//

import UIKit

class PeopleInfoViewController: UIViewController {
    @IBOutlet var peopleName: UILabel!
    
    var pvo: PeopleVO!
    
    override func viewDidLoad() {
        self.peopleName.text = pvo.peopleNm
    }
}
