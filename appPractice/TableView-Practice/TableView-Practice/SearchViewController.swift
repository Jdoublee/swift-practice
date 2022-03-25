//
//  SearchViewController.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/03/23.
//

import UIKit

class SearchViewController: UITableViewController {
    var list: [PeopleVO] = []
    var curPage = 1
    var peopleName: String = ""
    
    @IBOutlet var tfName: UITextField!
    @IBAction func searchBtn(_ sender: Any) {
        peopleName = tfName.text!
        curPage = 1
        list = [PeopleVO]()
        callPeopleAPI(name: peopleName)
    }
    
    @IBOutlet var moreBtn: UIButton!
    @IBAction func more(_ sender: Any) {
        callPeopleAPI(name: peopleName)
    }
    
    override func viewDidLoad() {
        self.moreBtn.isHidden = true
    }
    
    func callPeopleAPI(name: String) {
        let api_key = Bundle.main.apiKey
        
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/people/searchPeopleList.json?key=\(api_key)&peopleNm=\(name)&curPage=\(curPage)"
        
        guard let encUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let apiURI: URL! = URL(string: encUrl)
        
        let apiData = try! Data(contentsOf: apiURI)
        
        let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다."
        
        NSLog("API LOG : \(log)")
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let peopleListResult = apiDictionary["peopleListResult"] as! NSDictionary
            
            let peopleList = peopleListResult["peopleList"] as! NSArray
            
            for row in peopleList {
                let r = row as! NSDictionary
                
                let pvo = PeopleVO()
                
                pvo.peopleCd = r["peopleCd"] as? String
                pvo.peopleNm = r["peopleNm"] as? String
                pvo.peopleNmEn = r["peopleNmEn"] as? String
                pvo.repRoleNm = r["repRoleNm"] as? String
                pvo.filmoNames = r["filmoNames"] as? String
                
                self.list.append(pvo)
                
            }
            
            let totalCount = peopleListResult["totCnt"] as! Int
            
            if (self.list.count < totalCount) {
                self.moreBtn.isHidden = false
                curPage += 1
            } else {
                self.moreBtn.isHidden = true
            }
        } catch {
            NSLog("Parse Error!!")
        }
        
        
        
        
        
        
    }
}
