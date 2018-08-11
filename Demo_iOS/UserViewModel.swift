//
//  UserViewModel.swift
//  Demo_iOS
//
//  Created by Sarvesh on 10/08/18.
//  Copyright © 2018 venkatesh. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class UserViewModel: NSObject {
    
    @IBOutlet var apiCall: APICalls!
    
    func loadJsonData(completion: @escaping () -> ()) {
        
        apiCall.fetchData() { (responseJSON) in
            
            if !(responseJSON?.isEmpty ?? true) {
                
                for resp in (responseJSON?["rows"].arrayValue)! {

                userModel.append(User(inputDictionary:resp))

          
            }

            completion()

        }
            
    }

    }
    
    //return the number of rows for section
    func numberOfItemsInSection() -> Int {
        return userModel.count
    }
    
    func getTitle(_ indexPath: IndexPath) -> String {
        
        
        if userModel[indexPath.row].title == ""{
           
            return "No Title Available"
        }
        
        return userModel[indexPath.row].title ?? "No Title Available"
    }
    
    func getDescription(_ indexPath: IndexPath) -> String {
        
        if userModel[indexPath.row].description == ""{
            
            return "No Description Available"
        }
        
        return userModel[indexPath.row].description ?? "No Description Available"
    }
    
    
    func getImageString(_ indexPath: IndexPath) -> String {
        
        if userModel[indexPath.row].imageString == ""{
            
            return ""
        }
        
        return userModel[indexPath.row].imageString ?? "No name"
    }
    
    
   
   
    
}

  var userModel:[User] = [User]()

