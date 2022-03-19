//
//  ListViewController.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/03/18.
//

import UIKit

class ListViewController: UITableViewController {
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO] ()
        
        return datalist
    }()
    
    override func viewDidLoad() {
        
        let dateBefore7Days = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let current_date = formatter.string(from: dateBefore7Days!)
        
        self.callMovieAPI(today_date: current_date)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 생성할 목록 길이 반환
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    // 셀 객체 생성(컨텐츠 구성)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        NSLog("제목:\(row.movieNm!), 호출된 행번호:\(indexPath.row)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyCell") as! MovieCell
    
        cell.rankNum?.text = row.rank
        cell.movieName?.text = row.movieNm
        cell.accAudienceCnt?.text = "\(row.audiAcc!)명"
        cell.audienceCnt?.text = "+\(row.audiCnt!)명"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func callMovieAPI(today_date: String) {
        let api_key = Bundle.main.apiKey
        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=\(api_key)&weekGb=0&targetDt=\(today_date)"
        let apiURI: URL! = URL(string: url)
        
        let apiData = try! Data(contentsOf: apiURI)
        
        let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다"
        
        NSLog("API Result = \(log)")
                
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary

            let boxOfficeResult = apiDictionary["boxOfficeResult"] as! NSDictionary
            let weeklyBoxOfficeList = boxOfficeResult["weeklyBoxOfficeList"] as! NSArray
            
            for row in weeklyBoxOfficeList {
                let movie = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.rank = movie["rank"] as? String
                mvo.movieCd = movie["movieCd"] as? String
                mvo.movieNm = movie["movieNm"] as? String
                mvo.openDt = movie["openDt"] as? String
                mvo.audiAcc = movie["audiAcc"] as? String
                mvo.audiCnt = movie["audiCnt"] as? String
                
                self.list.append(mvo)
            }
        } catch {
            NSLog("Parse Error!!")
        }
    }
}
