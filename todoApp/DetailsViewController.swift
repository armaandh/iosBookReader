//
//  DetailsViewController.swift
//  todoApp
//
//  Created by Armaan Dhanji on 2018-03-09.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var bookSubtitle: UILabel!
    
    @IBOutlet weak var bookDescription: UILabel!
    
    
    @IBOutlet weak var myLbl: UILabel!
    var destinationMessage: String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        myLbl.text = destinationMessage
        bookDescription.textColor = UIColor.white

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fetchInfo(_ sender: Any) {
        
        let jsonURL = "https://www.googleapis.com/books/v1/volumes?q=title:head%20first"
        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            do{
                let myData = try JSONDecoder().decode(Item.self, from: data!)
                DispatchQueue.main.async {
                    self.bookTitle.text = "Title: " + (myData.items?.first?.volumeInfo?.title!)!
                    self.bookSubtitle.text = myData.items?.first?.volumeInfo?.subtitle! ?? "title"
                    self.bookDescription.text = "Description: " +  (myData.items?.first?.volumeInfo?.description!)!
                }
                print("\(myData.items?.first?.volumeInfo?.title! ?? "title") \(myData.items?.first?.volumeInfo?.publishedDate! ?? "publishedDate") \(myData.items?.first?.volumeInfo?.description! ?? "description") " )
            } catch{
                print(error.localizedDescription)
            }
        }).resume()
    }
}
