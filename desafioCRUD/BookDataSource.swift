//
//  BookDataSource.swift
//  desafioCRUD
//
//  Created by Luan Lima on 8/16/16.
//  Copyright © 2016 Luan Lima. All rights reserved.
//

import UIKit

class BookDataSource: NSObject {

    static var sharedInstance = BookDataSource()
    var bookData : NSMutableArray = NSMutableArray()
    var selectedBook: Book = Book()
    var flag: Int = Int()
    
    
    //Buscas todas as fazendas
    func getAllBooks() {
        bookData = ModelManager.getInstance().getAllBooks()
//        for (var aux = 0; aux < bookData.count; aux++){
//            let book = bookData[aux] as! Book
//            print("\book")
//        }
    }
    
    func deleteBook(book:Book){
        let delete = ModelManager.getInstance().deleteBook(book)
        print("Deletei? ",delete)
    }
    
    //MARK:- Getters
    func getAmountOfBooks()->Int{
        return bookData.count
    }
}
