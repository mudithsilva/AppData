//
//  AppData.swift
//  StackTest
//
//  Created by Mudith Chathuranga on 5/28/18.
//  Copyright © 2018 Chathuranga. All rights reserved.
//

import Foundation

class AppData {
    
    static let defaults = UserDefaults.standard
    
    static func storeData(data: String?, key: UserData!) {
        defaults.setValue(data, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    static func getData(key: UserData!) -> String {
        if let userData = defaults.string(forKey: key.rawValue) {
            return userData // Some String Value
        } else {
            return ""
        }
    }
    
    static func archiveUserInformation<T : Codable>(info: T) -> NSData {
        //Some code
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(info)
            return data as NSData
        } catch {
            // Handle error
            print(error)
            return NSData()
        }
        //Some more code
    }
    
    static func saveUserInformation<T : Codable>(info: T, key: UserData.RawValue) {
        let archivedObject = archiveUserInformation(info: info)
        defaults.set(archivedObject, forKey: key)
        defaults.synchronize()
    }
    
    static func retrieveUserInformation<T : Codable>(key: UserData.RawValue, type: T.Type) -> Any {
        
        let decoder = PropertyListDecoder()
        if let unarchivedObject = defaults.object(forKey: key) as? NSData {
            
            do {
                let data = try decoder.decode(T.self, from: unarchivedObject as Data)
                return data
            } catch {
                // Handle error
                print(error)
                return ""
            }
        } else {
            return ""
        }
    }
    
    static func removeAll() {
        self.storeData(data: nil, key: UserData(rawValue: UserData.postInfo.rawValue))
        self.storeData(data: nil, key: UserData(rawValue: UserData.userInfo.rawValue))
        self.storeData(data: nil, key: UserData(rawValue: UserData.commentInfo.rawValue))
    }
    
}

enum UserData: String {
    
    case postInfo = "POSTINFO"
    case userInfo = "USERINFO"
    case commentInfo = "COMMENTINFO"
    
    /////// Remove enum type also from self.removeAll() //////////
}
