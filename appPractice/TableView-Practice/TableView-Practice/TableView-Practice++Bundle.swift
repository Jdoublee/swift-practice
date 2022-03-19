//
//  TableView-Practice++Bundle.swift
//  TableView-Practice
//
//  Created by Jdoublee on 2022/03/18.
//

import Foundation

extension Bundle {
    var apiKey: String {
      get {
        guard let filePath = self.path(forResource: "Properties", ofType: "plist") else { return "" }

        guard let resource = NSDictionary(contentsOfFile: filePath) else { return "" }
        
        guard let key = resource["API_KEY"] as? String else {
          fatalError("API_KEY 설정이 필요합니다.")
        }
        
        return key
      }
    }
}
