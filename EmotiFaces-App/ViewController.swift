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
//        let unhappyString = "/Users/christophertrev/Desktop/latest.png";
//        emotionImage.image = UIImage(named:unhappyString);
        emotionImage.contentMode = .ScaleAspectFit
        
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/emotion")!)
//        var request = NSMutableURLRequest(URL: NSURL(string: "https://emotifaces.herokuapp.com/emotion")!)
        self.httpGet(request){
            (data, error) -> Void in
            if error != nil {
                println("error")
                println(error)
//                println(error.localizedDescription)
            } else {
//                println(data)
                var result = JSON(data: data)
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    for (key: String, subJson: JSON) in result {
                        //Do something you want
                        println(key, subJson)
                        self.pickerData.append(subJson.stringValue)
                    }
                    println(self.pickerData)
                    self.emotionPicker.dataSource = self;
                    self.emotionPicker.delegate = self;
                    
                })

//                self.pickerData.
//                self.pickerData = data.string!;
            }
        }
        
        var requestWithImage = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/emotion/happy")!)
        self.httpGet(requestWithImage){
            (data, error) -> Void in
            if error != nil {
                println("error")
                println(error)
                //                println(error.localizedDescription)
            } else {
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    println("loading image")
                    var imageView = UIImageView(frame: self.emotionImage.bounds)
                    imageView.contentMode = .ScaleAspectFill
                    imageView.image =  UIImage(data: data)
                    imageView.center = self.emotionImage.center
                    self.emotionImage.addSubview(imageView)
                    
                
                    
//                    self.emotionImage.contentMode = .ScaleAspectFill
//                    self.emotionImage.image = UIImage(data: data);
//                    self.emotionImage
                })
                
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
    
    

    func httpGet(request: NSURLRequest!, callback: (NSData, String?) -> Void) {
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                println(error.debugDescription)
                callback(NSData(), error.localizedDescription)
            } else {
//                var result = NSString(data: data, encoding:
//                    NSASCIIStringEncoding)!
                
                callback(data, nil)
            }
        }
        task.resume()
    }
    


    
}

