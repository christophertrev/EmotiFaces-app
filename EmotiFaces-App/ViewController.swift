//
//  ViewController.swift
//  EmotiFaces-App
//
//  Created by Christopher Trevino on 1/23/15.
//  Copyright (c) 2015 Christopher Trevino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emotionImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var unhappyString = "/Users/christophertrev/Desktop/latest.png";
        emotionImage.image = UIImage(named:unhappyString);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

