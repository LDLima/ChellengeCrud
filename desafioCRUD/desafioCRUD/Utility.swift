//
//  Utility.swift
//  ManageFarms
//
//  Created by Henrique Pereira da Silva on 10/30/15.
//  Copyright © 2015 Matheus de Melo Moreira. All rights reserved.
//

import UIKit

class Utility: NSObject {

    //Get path for specified files
    class func getPath (fileName: String) -> String {
        
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documentsURL.URLByAppendingPathComponent(fileName)
        
        print("\(documentsURL)")
        print("\(fileURL)\n\n")
        
        return fileURL.path!
    }
    
    //Copy files form source to destination
    class func copyFile(fileName: NSString) {
        let dbPath: String = getPath(fileName as String)
        let fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(dbPath) {
            
            let documentsURL = NSBundle.mainBundle().resourceURL
            let fromPath = documentsURL!.URLByAppendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItemAtPath(fromPath.path!, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
                print(error)
            }
        }
    }
    
    
}
