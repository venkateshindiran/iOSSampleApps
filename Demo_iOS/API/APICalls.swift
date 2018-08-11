//
//  APICalls.swift
//  Demo_iOS
//
//  Created by Sarvesh on 10/08/18.
//  Copyright © 2018 venkatesh. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class APICalls: NSObject {
    
    
    
func fetchData(completion: @escaping (JSON?) -> ())  {
        
        
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        
        Alamofire.request(url).responseJSON { response in
            print(response.result)   // result of response serialization
            
            let result = response.data
            
            if let d = result {
                
            if let value = String(data: d, encoding: String.Encoding.ascii) {
                    
            if let jsonData = value.data(using: String.Encoding.utf8) {
                do {
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                            
                         completion(JSON(json))
//                    if let arr = json["rows"] as? [[String: Any]] {
//                                debugPrint(arr)
//                        
//                    }
                    
                 } catch {
                            NSLog("ERROR \(error.localizedDescription)")
                            completion(nil)

                        }
                    }
                }
                
            }
            
            
            
        }
    
    }
    

}
