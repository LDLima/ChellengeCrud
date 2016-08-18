//
//  Books.swift
//  desafioCRUD
//
//  Created by Luan Lima on 8/16/16.
//  Copyright © 2016 Luan Lima. All rights reserved.
//

import UIKit

class Book: NSObject {

    var idBook: Int = Int()
    var name: String = String()
    var author: String = String()
    var edition: Int = Int()
    var publisher: String = String()
    var numberPages: Int = Int()
    
    override init(){
        super.init()
    }
    
    init(idBook: Int, name: String, author: String, edition: Int, publisher: String, numberPages: Int) {
        super.init()
        
        self.idBook = idBook
        self.name = name
        self.author = author
        self.edition = edition
        self.publisher = publisher
        self.numberPages = numberPages
    }
    
    init(name: String, author: String, edition: Int, publisher: String, numberPages: Int) {
        super.init()
        
        self.name = name
        self.author = author
        self.edition = edition
        self.publisher = publisher
        self.numberPages = numberPages
    }
    
    func printBook(book: Book){
        print(book.name)
    }
    
}
