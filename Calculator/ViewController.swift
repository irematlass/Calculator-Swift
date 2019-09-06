//
//  ViewController.swift
//  Calculator
//
//  Created by irem on 6.09.2019.
//  Copyright © 2019 irem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    @IBOutlet weak var resultScreen: UILabel!
    
    @IBAction func calculateSign(_ sender: UIButton) {
        if resultScreen.text != "" && sender.tag != 10 && sender.tag != 17{
            previousNumber = Double(resultScreen.text!)!
            switch sender.tag  {
            case 13 : resultScreen.text = "/"
            case 14 : resultScreen.text = "*"
            case 15 : resultScreen.text = "-"
            case 16 : resultScreen.text = "+"
            
                
            default: break
                
            }
                performingMath = true
                operation = sender.tag
        }else if sender.tag == 17
        {
            switch operation  {
            
            case 13 : resultScreen.text = String(previousNumber / numberOnScreen)
            case 14 : resultScreen.text = String(previousNumber * numberOnScreen)
            case 15 : resultScreen.text = String(previousNumber - numberOnScreen)
            case 16 : resultScreen.text = String(previousNumber + numberOnScreen)
                
            default:break
                
            }
            
        }else if sender.tag == 10{
            
            resultScreen.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
        }
        
        }
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true{
            resultScreen.text = String(sender.tag)
            numberOnScreen = Double(resultScreen.text!)!
            performingMath = false
            
        }else{
        
        resultScreen.text = resultScreen.text! + String(sender.tag)
        numberOnScreen = Double(resultScreen.text!)!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

