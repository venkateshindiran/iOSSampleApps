//
//  NetworkManager.swift
//  Demo_iOS
//
//  Created by Sarvesh on 10/08/18.
//  Copyright © 2018 venkatesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class NetworkManager: NSObject {
    
    var manager = Alamofire.SessionManager.default
    
    func isNetworkRechable() -> Bool {
        
        if (NetworkReachabilityManager()?.isReachable)! {
            print("Network reachable")
            return true
        }
        print("Network not-reachable")
        return false
    }
    
    convenience required init(timeoutInterval:Double) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = timeoutInterval
        self.init()
        manager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func getRequest(_ url : String! , params : [String: Any]?, completion:((Any) -> ())?) -> Void {
        
        manager.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            switch (response.result) {
            case .success:
                guard let res = response.result.value else
                {
                    print("ERROR: \(String(describing: response.result.error))")
                    return
                }
                completion!(res)
                break
                
            case .failure(let error):
                //if error._code == NSURLErrorTimedOut {
                completion!(error)
                // }
                print("\n\nAuth request failed with error:\n \(error)")
                break
            }
            
            //            guard let res = response.result.value else
            //            {
            //                print("ERROR: \(response.result.error)")
            //                return
            //            }
            //            completion!(res)
        }
    }
    
    func requestGetMethod(_ strURL: String, params : [String: Any]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type":"application/json",
            ]
        manager.request(strURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) in
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }

    
    
    
    
}
