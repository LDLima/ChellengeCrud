//
//  ViewController.swift
//  desafioCRUD
//
//  Created by Luan Lima on 8/16/16.
//  Copyright © 2016 Luan Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblEdition: UILabel!
    @IBOutlet weak var lblPublishing: UILabel!
    @IBOutlet weak var lblNumberPages: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Details Book"
        self.loadDatas()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Loading informations
    func loadDatas(){
        self.lblName.text = BookDataSource.sharedInstance.selectedBook.name
        self.lblAuthor.text = BookDataSource.sharedInstance.selectedBook.author
        self.lblEdition.text = String(BookDataSource.sharedInstance.selectedBook.edition)
        self.lblPublishing.text = BookDataSource.sharedInstance.selectedBook.publisher
        self.lblNumberPages.text = String(BookDataSource.sharedInstance.selectedBook.numberPages)
    }

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Change"){
            BookDataSource.sharedInstance.flag = BookDataSource.sharedInstance.selectedBook.idBook
        }
    }
    

}
