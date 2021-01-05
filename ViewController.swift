
//  ViewController.swift
//  calculatorlab
//  Created by priyanka borate on 11/25/20.


import UIKit

class ViewController: UIViewController {
    
    var numbersOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0

    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numbersOnScreen = Double(label.text!)!
            performingMath = false
        }
        
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numbersOnScreen = Double(label.text!)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 //divide
            {
                label.text = "/"
            }
            else if sender.tag == 13 // multiply
            {
                label.text = "*"
            }
            else if sender.tag == 14 // rest
            {
                 label.text = "-"
            }
            else if sender.tag == 15 // addition
            {
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        
        else if sender.tag == 16
        {
            if operation == 12
            {
               label.text = String(previousNumber / numbersOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numbersOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numbersOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numbersOnScreen)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0
            numbersOnScreen = 0
            operation = 0
        }
    }
    


}

