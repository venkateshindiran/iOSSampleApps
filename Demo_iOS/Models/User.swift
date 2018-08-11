//
//  User.swift
//  Demo_iOS
//
//  Created by Sarvesh on 10/08/18.
//  Copyright © 2018 venkatesh. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    
    var title:String? = nil
    var description:String? = nil
    var imageString:String? = nil
    
    
    /// Converts Dictionary to model
    ///
    /// - Parameter inputDictionary: input dictionary
    /// - Throws: error
    init(inputDictionary: JSON? = nil) {
        guard let responseDict = inputDictionary else {
            return
        }
        
        title = responseDict.dictionaryValue["title"]?.stringValue ?? "No Content"
        description = responseDict.dictionaryValue["description"]?.stringValue ?? "No Content"
        imageString = responseDict.dictionaryValue["imageHref"]?.stringValue ?? "No Content"

        print(title!,description!,imageString!)
        
     print(responseDict)
    }
}

