//
//  ViewController.swift
//  helloproject
//
//  Created by apple on 28/02/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("sanke")
       
      //  self.readValues(fname: "NIrdesh", lname: "chidni", email: "nirdesh@agility.com", password: "123", role: "aula")
      // self.UpdateQuery()
       // self.DeleteQuery()
       // self.getSqlData()
        
        
    }
    
    func submit() {
        
    }
    
    func sendToServer(name: String, address: String, phone: String) {
    }
func opendatabase ()->OpaquePointer
{
    var db: OpaquePointer? = nil
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("Inventory.db")
    
    
    
    if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
        print("Successfully opened connection to database at \(fileURL.path)")
        return db!
    } else {
        print("Unable to open database. Verify that you created the directory described " +
            "in the Getting Started section.")
        return db!
    }
    
   
    
    
    //creating table
   
}
    
    func readValues(fname:NSString,lname :NSString,email:NSString,password:NSString,role:NSString){
        let db = self.opendatabase()
        
        //"CREATE TABLE IF NOT EXISTS Heroes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Users (UserID INTEGER PRIMARY KEY AUTOINCREMENT, FirstName TEXT, LastName TEXT, Email TEXT, Password TEXT, Role TEXT )", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        let insertStatementString = "INSERT INTO Users (FirstName, LastName, Email, Password, Role) VALUES ('\(fname)', '\(lname)', '\(email)', '\(password)', '\(role)')"
        var insertStatement: OpaquePointer? = nil
     
        // 1
       
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
          
            
         /*   sqlite3_bind_text(insertStatement, 1, "Jana", -1, nil)
            sqlite3_bind_text(insertStatement, 2, "Reddy", -1, nil)
            sqlite3_bind_text(insertStatement, 3, "jana@gmail.com", -1, nil)
            sqlite3_bind_text(insertStatement, 4, "123456", -1, nil)
            sqlite3_bind_text(insertStatement, 5, "admin", -1, nil)*/
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
        
       
    }
    
    func getSqlData()
    {
    let queryString = "SELECT * FROM Users"
    
    //statement pointer
    var stmt:OpaquePointer?
     let db = self.opendatabase()
    //preparing the query
    if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("error preparing insert: \(errmsg)")
    return
    }
    
    //traversing through all the records
    while(sqlite3_step(stmt) == SQLITE_ROW){
    let id = sqlite3_column_int(stmt, 0)
    let name = String(cString: sqlite3_column_text(stmt, 2))
    let powerrank = String(cString: sqlite3_column_text(stmt, 3))
    print (id,name,powerrank)
    //adding values to list
    }
        
    }
    
    func UpdateQuery()
    {
         let db = self.opendatabase()
        let insertStatementString = "Update Users SET Email = 'banalajanardhanio@gmail.com' WHERE UserID = 7"
        var insertStatement: OpaquePointer? = nil
        
        // 1
        
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            
            /*   sqlite3_bind_text(insertStatement, 1, "Jana", -1, nil)
             sqlite3_bind_text(insertStatement, 2, "Reddy", -1, nil)
             sqlite3_bind_text(insertStatement, 3, "jana@gmail.com", -1, nil)
             sqlite3_bind_text(insertStatement, 4, "123456", -1, nil)
             sqlite3_bind_text(insertStatement, 5, "admin", -1, nil)*/
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
    }
    
    
    func DeleteQuery()
    {
        let db = self.opendatabase()
        let insertStatementString = "Delete FROM Users WHERE UserID = 7"
        var insertStatement: OpaquePointer? = nil
        
        // 1
        
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            
            /*   sqlite3_bind_text(insertStatement, 1, "Jana", -1, nil)
             sqlite3_bind_text(insertStatement, 2, "Reddy", -1, nil)
             sqlite3_bind_text(insertStatement, 3, "jana@gmail.com", -1, nil)
             sqlite3_bind_text(insertStatement, 4, "123456", -1, nil)
             sqlite3_bind_text(insertStatement, 5, "admin", -1, nil)*/
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
    }
}

