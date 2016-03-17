//
//  ViewController.swift
//  Part IV
//
//  Created by Brian Hill on 3/16/16.
//  Copyright © 2016 St. Mary's College of California. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // This is the label that shows the count
    @IBOutlet var counterLabel: UILabel?
    
    var counter = 0
    
    func setLabel() {
        counterLabel!.text = "\(counter)"
    }
    
    // This is the method that the + button fires.
    @IBAction func incrementCounter(sender: UIButton) {
        counter += 1
        setLabel()
    }
    
    // You are going to need another method that the - button fires.
    // Something like:
    // @IBAction func decrementCounter ...

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
