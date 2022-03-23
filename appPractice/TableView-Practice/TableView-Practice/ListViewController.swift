//
//  ListViewController.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/03/18.
//

import UIKit

class ListViewController: UITableViewController {
    var currentDate = Date()
    
    @IBOutlet var weekInfo: UILabel!
    
    @IBAction func weekBefore(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -7, to: currentDate)!
        
        list = [MovieVO]()
        
        self.callMovieAPI(today_date: currentDate)
        
        tableView.reloadData()
        tableView.reloadSections([0], with: .none)
    }
    
    @IBAction func weekAfter(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 7, to: currentDate)!
        
        list = [MovieVO]()
        
        self.callMovieAPI(today_date: currentDate)
        
        tableView.reloadData()
        tableView.reloadSections([0], with: .none)
    }
    
//    lazy var list: [MovieVO] = {
//        var datalist = [MovieVO] ()
//
//        return datalist
//    }()
    var list: [MovieVO] = []
    
    override func viewDidLoad() {
        
        currentDate = Calendar.current.date(byAdding: .day, value: -7, to: currentDate)!
        
        self.callMovieAPI(today_date: currentDate)
        
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")

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
    
//    // 헤더 추가
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader")
//
//        return header
//    }
//
//    // 헤더 높이
//        override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 40
//        }
//
//    // 헤더 관련 설정
//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        guard let header = view as? UITableViewHeaderFooterView else { return }
//
//        let view = UIView(frame: .zero)
//        view.backgroundColor = .white
//
//        let dateBefore7Days = Calendar.current.date(byAdding: .day, value: -7, to: Date())
//        let year = Calendar.current.component(.year, from: dateBefore7Days!)
//        let month = Calendar.current.component(.month, from: dateBefore7Days!)
//        let week = Calendar.current.component(.weekOfMonth, from: dateBefore7Days!)
//
//        header.textLabel?.text = "<\(year)년 \(month)월 \(week)주차>"
//        header.textLabel?.textAlignment = .center
//        header.textLabel?.textColor = .black
//        header.backgroundView = view
//    }

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
    func callMovieAPI(today_date: Date) {
        let year = Calendar.current.component(.year, from: today_date)
        let month = Calendar.current.component(.month, from: today_date)
        let week = Calendar.current.component(.weekOfMonth, from: today_date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let current_date = formatter.string(from: today_date)
        
        let api_key = Bundle.main.apiKey
        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=\(api_key)&weekGb=0&targetDt=\(current_date)"
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
            
            weekInfo.text = "<\(year)년 \(month)월 \(week)주차>"
        } catch {
            NSLog("Parse Error!!")
        }
    }
}

extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail" {
            let cell = sender as! MovieCell
            let path = self.tableView.indexPath(for: cell)
            
            let movieinfo = self.list[path!.row]
            
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = movieinfo
        }
    }
}
