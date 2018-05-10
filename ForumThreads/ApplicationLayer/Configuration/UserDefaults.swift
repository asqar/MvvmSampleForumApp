//
//  Utils.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit
import Foundation

class MyUserDefaults {

    // MARK: - Settings Bug Workaround

    class func saveToUserDefaults(key:String!, value valueString:String!) {
        let standardUserDefaults:UserDefaults! = UserDefaults.standard

        if (standardUserDefaults != nil) {
            standardUserDefaults.set(valueString, forKey:key)
            standardUserDefaults.synchronize()
        }
    }

    class func removeFromUserDefaults(key:String!) {
        let standardUserDefaults:UserDefaults! = UserDefaults.standard

        if (standardUserDefaults != nil) {
            standardUserDefaults.removeObject(forKey: key)
            standardUserDefaults.synchronize()
        }
    }

    class func retrieveBooleanFromUserDefaults(key:String!) -> Bool {
        let s:String! = MyUserDefaults.retrieveFromUserDefaults(key: key)
        return NSString(string: s).boolValue
    }

    class func retrieveFromUserDefaults(key:String!) -> String! {
        let standardUserDefaults:UserDefaults! = UserDefaults.standard
        var val:String! = nil

        if (standardUserDefaults != nil)
        {
            val = standardUserDefaults.object(forKey:key) as! String
        }

        // TODO: / apparent Apple bug: if user hasn't opened Settings for this app yet (as if?!), then
        // the defaults haven't been copied in yet.  So do so here.  Adds another null check
        // for every retrieve, but should only trip the first time
        if val == nil {
            //Get the bundle path
            let bPath:String! = Bundle.main.bundlePath
            let settingsPath:String! = bPath.appending("Settings.bundle")
            let plistFile:String! = NSURL(fileURLWithPath: settingsPath).appendingPathComponent("Root.plist")?.absoluteString

            //Get the Preferences Array from the dictionary
            let settingsDictionary:NSDictionary! = NSDictionary(contentsOfFile: plistFile)! as NSDictionary
            let preferencesArray:[AnyObject]! = settingsDictionary.object(forKey: "PreferenceSpecifiers") as! [AnyObject]

            //Loop through the array
            for item:NSDictionary? in preferencesArray as! [NSDictionary] {
                //Get the key of the item.
                let keyValue:String! = item!.object(forKey: "Key") as! String

                //Get the default value specified in the plist file.
                let defaultValue:AnyObject! = item!.object(forKey: "DefaultValue") as AnyObject

                if (keyValue != nil) && (defaultValue != nil) {
                    standardUserDefaults.set(defaultValue, forKey:keyValue)
                    if keyValue.compare(key) == ComparisonResult.orderedSame {
                        val = defaultValue as! String?
                    }
                }
             }
            standardUserDefaults.synchronize()
        }
        return val
    }
}
