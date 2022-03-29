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
    
    var filmoList = [String]()
    
    override func viewDidLoad() {
        self.peopleName.text = pvo.peopleNm
        seperateFilmoNames()
    }
    
    func seperateFilmoNames() {
        let seperatedList = self.pvo.filmoNames!.split(separator: "|")
        
        for sep in seperatedList {
            filmoList.append(String(sep))
        }
    }
}
