//
//  ViewController.swift
//  EmotiFaces-App
//
//  Created by Christopher Trevino on 1/23/15.
//  Copyright (c) 2015 Christopher Trevino. All rights reserved.
//

import Foundation
//import XCPlayground
import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    
    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var emotionPicker: UIPickerView!
    var pickerData : [String] = [];
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let unhappyString = "/Users/christophertrev/Desktop/latest.png";
        emotionImage.image = UIImage(named:unhappyString);

        
        var request = NSMutableURLRequest(URL: NSURL(string: "http://10.7.4.245:3000/emotion")!)
//        var request = NSMutableURLRequest(URL: NSURL(string: "https://emotifaces.herokuapp.com/emotion")!)
        self.httpGet(request){
            (data, error) -> Void in
            if error != nil {
                println("error")
                println(error)
//                println(error.localizedDescription)
            } else {
                println(data)
                var arr : [String];
                
                for (key: String, subJson: JSON) in data {
                    //Do something you want
                    println(key, subJson)
                    self.pickerData.append(subJson.stringValue)
                    
                }
                println(self.pickerData)
                self.emotionPicker.dataSource = self;
                self.emotionPicker.delegate = self;
//                self.pickerData.
//                self.pickerData = data.string!;
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count;
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        myLabel.text = pickerData[row]
    }
    
    

    func httpGet(request: NSURLRequest!, callback: (JSON, String?) -> Void) {
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                println(error.debugDescription)
                callback("", error.localizedDescription)
            } else {
//                var result = NSString(data: data, encoding:
//                    NSASCIIStringEncoding)!
                var result = JSON(data: data)
                callback(result, nil)
            }
        }
        task.resume()
    }
    


    
}

