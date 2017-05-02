//
//  miLady.swift
//  Logga
//
//  Created by Jerry U. on 5/2/17.
//  Copyright © 2017 Lyshnia Limited. All rights reserved.
//

import Cocoa
import GRDB

class miLady: NSObject {
    let dbQueue : DatabaseQueue?
    
    override init() {
        do {
            dbQueue = try DatabaseQueue(path: "/Users/mac/Downloads/dreamer.db")
        } catch {
            dbQueue = nil
        }
    }
    
    func execute(_ sql: String, arguements args: StatementArguments? = nil) -> (RowID: Int64?, Err: Error?) {
        var rowID: Int64?
        var Err: Error?
        
        do {
            try dbQueue?.inDatabase { db in
                
                try db.execute(sql, arguments: args)
                
                rowID = db.lastInsertedRowID
            }
        } catch {
            Err = error
        }
        return (rowID, Err)
    }
    
    func mkMillions() {
        do {
            try dbQueue?.inDatabase { db in
                var moose = Million(id: 19, name: "Moose", pass: "2w323")
                try moose.insert(db)
            }
        } catch {
            print("\n\t<---------------------------->\(error)")
        }
    }
    
}

struct Million : MutablePersistable {
    /// The name of the database table
    static var databaseTableName = "Million"

    var id: Int64
    var name: String
    var pass: String
    
    /// The values persisted in the database
    var persistentDictionary: [String: DatabaseValueConvertible?] {
        return [
            "id": id,
            "name": name,
            "pass": pass
        ]
    }

    // Update id upon successful insertion:
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
}

extension Million : RowConvertible {
    init(row: Row) {
        id = row.value(named: "id")
        name = row.value(named: "name")
        pass = row.value(named: "pass")
    }

}
