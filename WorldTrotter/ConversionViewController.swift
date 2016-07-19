//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by BUKOLA OMOTOSO on 14/07/2016.
//  Copyright © 2016 ANDELA. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController, UITextFieldDelegate    {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConvertController loaded its view")
    }
    
    override func viewWillAppear(animated: Bool) {
            let hour = NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: NSDate())
        if (hour > 18 || hour < 6)  {
            view.backgroundColor = UIColor.darkGrayColor()
        }   else    {
            view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBOutlet var celsiusLabel :UILabel!
    @IBOutlet var fahrenheitLabel :UITextField!
    
    
    
    var fahrenheitValue:Double? {
        didSet  {
            updateCelsiusLabel()
        }
    }
    var celsiusValue:Double?    {
        if let value = fahrenheitValue  {
            return (value-32) * (5/9)
        }   else    {
            return nil
        }
    }
    //This is a closure
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func fahrenheitFieldEditingChanged(textField:UITextField) {
        if let text = textField.text, value = numberFormatter.numberFromString(text)  {
            fahrenheitValue = value.doubleValue
        }   else    {
            fahrenheitValue = nil
        }
        
    }
    func updateCelsiusLabel(){
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }   else    {
            celsiusLabel.text = "???"
        }
    }
    
    //Prevent double decimals and Numbers
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let currentLocale = NSLocale.currentLocale()
        let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)


        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil  {
            return false
        }   else {
            if let _ = string.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet())   {
                return false
            }   else{
                return true
            }
        }
}
}
    

