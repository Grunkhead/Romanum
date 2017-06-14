//
//  ViewController.swift
//  Romanum
//
//  Created by Dave Buitenhuis on 12-01-16.
//  Copyright © 2016 Dave Buitenhuis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var field2: UITextField!
    
    var convert = Converter()
    let validator = Validator()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // Wordt aangeroepen wanneer 'return' knop is ingedrukt.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Toegevoegd zodat als je 'return' aanklikt op het toestenbord het toetstenbord sluit.
        field.delegate = self
        field2.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func convert(value: String) {
        
        if validator.checkForValidInt(value) {
            label.text = convert.toRoman(value)
        } else {
            label.text = "Insert valid value.."
        }
    }
    
    @IBAction func convert2(sender: AnyObject) {
        label2.text = convert.toArabic(field2.text!)
    }
    
    
}

