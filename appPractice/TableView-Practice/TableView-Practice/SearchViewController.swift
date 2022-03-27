//
//  SearchViewController.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/03/23.
//

import UIKit

class SearchViewController: UITableViewController, UITextFieldDelegate {
    var peopleList: [PeopleVO] = []
    var curPage = 1
    var peopleName: String = ""
    
    @IBOutlet var tfName: UITextField!
    @IBOutlet var searchBtn: UIButton!
    
    @IBAction func search(_ sender: Any) {
        peopleName = tfName.text!
        curPage = 1
        peopleList = [PeopleVO]()
        
        self.tfName.endEditing(true)
        self.callPeopleAPI(name: peopleName)
        self.tableView.reloadData() // 테이블 뷰 안나오는거 해결.
    }
    
    @IBOutlet var moreBtn: UIButton!
    @IBAction func more(_ sender: Any) {
        self.callPeopleAPI(name: peopleName)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        self.moreBtn.isHidden = true
        self.hideKeyboard()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peopleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.peopleList[indexPath.row]
        
        NSLog("제목:\(row.peopleNm!), 호출된 행번호:\(indexPath.row)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell") as! PeopleCell
        
        cell.peopleName?.text = row.peopleNm
        cell.peopleNameEng?.text = row.peopleNmEn
        cell.roleName?.text = row.repRoleNm
        cell.filmoNames?.text = row.filmoNames
        
        return cell
    }
    
    // MARK: - UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        self.search(self.searchBtn!)
        
        return true
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
                let people = row as! NSDictionary
                
                let pvo = PeopleVO()
                
                pvo.peopleCd = people["peopleCd"] as? String
                pvo.peopleNm = people["peopleNm"] as? String
                pvo.peopleNmEn = people["peopleNmEn"] as? String
                pvo.repRoleNm = people["repRoleNm"] as? String
                pvo.filmoNames = people["filmoNames"] as? String
                
                self.peopleList.append(pvo)
                                
            }
            
            let totalCount = peopleListResult["totCnt"] as! Int
            
            if (self.peopleList.count < totalCount) {
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

extension SearchViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(SearchViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
