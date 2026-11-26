//
//  AppDelegate.swift
//  Assignment1PizzaOrder
//
//  Created by Ryan Franco on 2026-09-27.
//

import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var databaseName : String = "pizzaorder.db"
    
    var databasePath : String = ""
    
    var orders : [OrderData] = []
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentDirectory = documentPath[0]
        
        databasePath = documentDirectory.appending("/" + databaseName)
        
        checkAndCreateDatabase()
        readDataFromDatabase()
        
        
        
        return true
    }
    
    func checkAndCreateDatabase(){
        
        var success = true
        
        let fileManager = FileManager.default
        
        
        success = fileManager.fileExists(atPath: databasePath)
        
        if success{return}
        
        let databasePathFromApp = (Bundle.main.resourcePath?.appending("/" + databaseName))!
        
        try? fileManager.copyItem(atPath: databasePathFromApp, toPath: databasePath)
        
        
        
    }
    
    
    func insertIntoDatabase(order : OrderData) -> Bool {
        
        var db: OpaquePointer? = nil
        var returnCode: Bool = true
        
        if sqlite3_open(databasePath, &db) == SQLITE_OK {
            
            var insertStatement: OpaquePointer? = nil
            
            var insertStatementString: String = "insert into entries values(NULL, ?, ?, ?, ?, ?, ?)"
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                
                
                
                
                
                let dateStr = order.deliveryDate ?? ""
                
                let meatStr = order.meatToppings ?? ""
                
                let vegStr = order.vegToppings ?? ""
                
                let avatarStr = order.avatar ?? ""
                
                let addressStr = order.address ?? ""
                
                
                
                sqlite3_bind_text(insertStatement, 1, (dateStr as NSString).utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 2, (addressStr as NSString).utf8String, -1, nil)
                
                sqlite3_bind_int(insertStatement, 3, Int32(order.size ?? 0))
                
                
                sqlite3_bind_text(insertStatement, 4, (meatStr as NSString).utf8String, -1, nil)
                
                
                sqlite3_bind_text(insertStatement, 5, (vegStr as NSString).utf8String, -1, nil)
                
                
                sqlite3_bind_text(insertStatement, 6, (avatarStr as NSString).utf8String, -1, nil)
                
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    
                    let rowID = sqlite3_last_insert_rowid(db)
                    
                    print("Inserted row: \(rowID)")
                    
                }
                else
                {
                    print("Insert statement could not be completed")
                    returnCode = false
                }
                
            }
            else
            {
                print("Insert statement could not be prepared")
                returnCode = false
            }
            
            sqlite3_finalize(insertStatement)
            
        }
        else
        {
            returnCode = false
        }
        
        sqlite3_close(db)
        
        return returnCode
        
    }
    
    
    
    func readDataFromDatabase(){
        
        
        orders.removeAll()
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(databasePath, &db) == SQLITE_OK{
            
            print("database is opened at \(databasePath)")
            
            var queryStatement: OpaquePointer? = nil
            var queryStatmentString: String = "select * from entries"
            
            if sqlite3_prepare_v2(db, queryStatmentString, -1, &queryStatement, nil) == SQLITE_OK{
                
                while sqlite3_step(queryStatement ) == SQLITE_ROW{
                    
                    let id: Int = Int(sqlite3_column_int(queryStatement,0 ))
                    
                    let cdate = sqlite3_column_text(queryStatement, 1)
                    
                    let caddress = sqlite3_column_text(queryStatement, 2    )
                    
                    let size: Int = Int(sqlite3_column_int(queryStatement, 3))
                    
                    let cmeat = sqlite3_column_text(queryStatement, 4)
                    
                    
                    let cveg = sqlite3_column_text(queryStatement, 5)
                    
                    let cavatar = sqlite3_column_text(queryStatement, 6)
                    
                    let deliveryDate = String(cString: cdate!)
                    
                    
                    let address = String(cString: caddress!)
                    
                    
                    let meatToppings = String(cString: cmeat!)
                    
                    
                    let vegToppings = String(cString: cveg!)
                    
                    let avatar = String(cString: cavatar!)
                    
                    
                    let data : OrderData = .init()
                    
                    
                    
                    data.initWithData(theRow: id, theDate: deliveryDate, theAddress: address, size: size, theMeat: meatToppings, theVeg: vegToppings, theAvatar: avatar)
                    
                    
                    orders.append(data)
                    
                    
                    print("query results")
                    
                    print("\(id) | \(deliveryDate) | \(address) | \(size) | \(meatToppings) | \(vegToppings) | \(avatar)")
                    
                    
                }
                
                sqlite3_finalize(queryStatement)
                
            }
            else
            {
                print("selection could not be completed")
                
            }
            
            
            
            
            
            
        }
        
        
        sqlite3_close(db)
        
        
        
        
    }
    
    
    
    
    
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    
}


