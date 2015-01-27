//
//  ViewController.swift
//  EmotiFaces-App
//
//  Created by Christopher Trevino on 1/23/15.
//  Copyright (c) 2015 Christopher Trevino. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    
    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var emotionPicker: UIPickerView!
    let pickerData = ["happy", "sad"];

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let unhappyString = "/Users/christophertrev/Desktop/latest.png";
        emotionImage.image = UIImage(named:unhappyString);
        emotionPicker.dataSource = self;
        emotionPicker.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func viewForRow(row:Int, forComponent:Int)
//    {
//    float rate = [_exchangeRates[row] floatValue];
//    float dollars = [_dollarText.text floatValue];
//    float result = dollars * rate;
    
//    NSString *resultString = [[NSString alloc] initWithFormat:
//    @"%.2f USD = %.2f %@", dollars, result,
//    _countryNames[row]];
//    _resultLabel.text = resultString;
//    }

    
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
    

    
}

