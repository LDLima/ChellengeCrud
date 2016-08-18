//
//  ModelManager.swift
//  desafioCRUD
//
//  Created by Luan Lima on 8/16/16.
//  Copyright © 2016 Luan Lima. All rights reserved.
//

import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject {

    var database: FMDatabase? = nil
    
    class func getInstance() -> ModelManager {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Utilitys.getPath("desafioCRUD.sqlite"))
        }
        return sharedInstance
    }
    
    //Get for All books
    func getAllBooks() -> NSMutableArray {
        sharedInstance.database?.open()
        let resultSet: FMResultSet! = sharedInstance.database?.executeQuery("SELECT * FROM BOOKS", withArgumentsInArray: nil)
        let array: NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next(){
                array.addObject(fillBooks(resultSet))
            }
        }
        sharedInstance.database?.close()
        return array
    }
    
    //Include Books
    func addBooks(book: Book) -> Bool{
        sharedInstance.database?.open()
        let insert = sharedInstance.database?.executeUpdate("insert into books (name, author, edition, publishing, pageNumber) values (? ,? ,?, ?, ?)", withArgumentsInArray: [book.name, book.author, book.edition, book.publisher, book.numberPages])
        sharedInstance.database?.close()
        return insert!
    }
    
    //Update Book
    func updateBook(book: Book)->Bool{
        sharedInstance.database?.open()
//        update books SET name = 'Heranca' where idBook = 7
//        let update = sharedInstance.database?.executeUpdate("update books SET name = 'Eragon' where idBook = 7", withArgumentsInArray: nil)
        
        
        let update = sharedInstance.database?.executeUpdate("update books SET name = ?, author = ?, edition =?, publishing =?, pageNumber = ? where idBook = ?", withArgumentsInArray: [book.name, book.author, book.edition, book.publisher, book.numberPages, book.idBook])
        sharedInstance.database?.close()
        return update!
    }
    
    //Delete Book
    func deleteBook(book: Book) -> Bool{
        sharedInstance.database?.open()
        let delete = sharedInstance.database?.executeUpdate("delete from books where idBook = ?", withArgumentsInArray: [book.idBook])
        sharedInstance.database?.close()
        return delete!
    }
    
    
    // Fill Books
    func fillBooks (resultSet: FMResultSet) -> Book{
        
        let bookInfo: Book = Book(idBook: Int(resultSet.intForColumn("idBook")), name: resultSet.stringForColumn("name"), author: resultSet.stringForColumn("author"), edition: Int(resultSet.intForColumn("edition")), publisher: resultSet.stringForColumn("publishing"), numberPages:Int( resultSet.intForColumn("pageNumber")))
        
        return bookInfo
    }

    
    
}
