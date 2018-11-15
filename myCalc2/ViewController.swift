//
//  ViewController.swift
//  myCalc2
//
//  Created by 小杉太一 on 2017/04/08.
//  Copyright © 2017年 小杉太一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnLabel:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    var usedPeriod = false;
    
    @IBOutlet weak var label: UILabel!

    @IBAction func numbers(_ sender: UIButton) {
        
        if(sender.tag == 18){
            if(usedPeriod == false){
            label.text = label.text! + ".";
            numberOnLabel = Double(label.text!+"0")!
            usedPeriod = true;
            }
        }else{
        if(performingMath == true){
            label.text = String(sender.tag-1);
            numberOnLabel = Double(label.text!)!;
            performingMath = false;
        }else{
            if(label.text != "0"){
            label.text = label.text! + String(sender.tag-1)
            numberOnLabel = Double(label.text!)!
            }else{
                label.text = String(sender.tag-1);
                numberOnLabel = Double(label.text!)!
            }
        }
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if(label.text != "" && sender.tag == 17 || sender.tag == 19){
            if(sender.tag == 17){
            numberOnLabel = Double(label.text!)! * 1.08;
            label.text = String(numberOnLabel);
            usedPeriod = true
            }else{
                numberOnLabel = numberOnLabel / 10;
                label.text = String(Int(numberOnLabel));
            }
        }
        else if(label.text != "" && sender.tag != 11 && sender.tag != 16){
            
            previousNumber = Double(label.text!)!;
            
            if(sender.tag == 12){//devide
                 label.text = "/";
            }
            else if(sender.tag == 13){//multiply
                 label.text = "*";
            }
            else if(sender.tag == 14){//minus
                 label.text = "-";
            }
            else if(sender.tag == 15){//plus
                label.text = "+";
            }
            performingMath = true;
            operation = sender.tag;
        }
        else if(sender.tag == 16){
            if(operation == 12){
                label.text = String(previousNumber / numberOnLabel);
            }
            else if(operation == 13){
                label.text = String(previousNumber * numberOnLabel);
            }
            else if(operation == 14){
                label.text = String(previousNumber - numberOnLabel);
            }
            else if(operation == 15){
                label.text = String(previousNumber + numberOnLabel);
            }
        }
        else if(sender.tag == 11){
            label.text = "0"
            previousNumber = 0
            numberOnLabel = 0
            operation = 0
            usedPeriod = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

