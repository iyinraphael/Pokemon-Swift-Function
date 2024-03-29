//
//  ViewController.swift
//  Pokemon-Swift-Function
//
//  Created by Iyin Raphael on 8/20/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonClicked(_ sender: Any) {
        
        let functionURL = "https://denim-armadillo-3334.twil.io/swift"
        if let url = URL(string: functionURL) {
            let task = URLSession.shared.dataTask(with: url) {
                data, response, error in
                if error != nil {
                    print(error!)
                } else {
                    do {
                        let responseObject = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]
                        DispatchQueue.main.async {
                            self.jokeLabel.text = (responseObject![0]["text"] as! String)
                            print("\(responseObject)")
                            self.jokeLabel.font = self.jokeLabel.font.withSize(12)
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

