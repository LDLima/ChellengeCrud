//
//  InputTableViewController.swift
//  desafioCRUD
//
//  Created by Luan Lima on 8/16/16.
//  Copyright © 2016 Luan Lima. All rights reserved.
//

import UIKit

class InputTableViewController: UITableViewController {

    @IBOutlet weak var nameBook: UITextField!
    @IBOutlet weak var nameAuthor: UITextField!
    @IBOutlet weak var numberEdition: UITextField!
    @IBOutlet weak var namePublisher: UITextField!
    @IBOutlet weak var numberPages: UITextField!
    
    
    @IBAction func saveBook(sender: AnyObject){
        let book = Book(name: self.nameBook.text!, author: self.nameAuthor.text!, edition: Int(self.numberEdition.text!)!, publisher: self.namePublisher.text!, numberPages: Int(self.numberPages.text!)!)
        if (BookDataSource.sharedInstance.flag != 0){
            book.idBook = BookDataSource.sharedInstance.flag
            updateBook(book)
        }else{
            saveNewBook(book)
        }
        navigationController?.popToRootViewControllerAnimated(true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (BookDataSource.sharedInstance.flag != 0){
            self.nameBook.text = BookDataSource.sharedInstance.selectedBook.name
            self.nameAuthor.text = BookDataSource.sharedInstance.selectedBook.author
            self.numberEdition.text = String(BookDataSource.sharedInstance.selectedBook.edition)
            self.namePublisher.text = BookDataSource.sharedInstance.selectedBook.publisher
            self.numberPages.text = String(BookDataSource.sharedInstance.selectedBook.numberPages)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateBook(book:Book){
        if (ModelManager.getInstance().updateBook(book)){
            print("Alterei!")
        }else{
            print("Não alterei!")
        }
    }
    
    func saveNewBook(book:Book){
        if (ModelManager.getInstance().addBooks(book)){
            print("Salvei!")
        }else{
            print("Não Salvei!")
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
