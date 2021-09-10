//
//  ViewController.swift
//  countTipApp
//
//  Created by CheChenLiu on 2021/8/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var numberOneTextField: UITextField!
    @IBOutlet weak var numberTwoTextField: UITextField!
    
    @IBOutlet weak var operatorSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberResult: UILabel!
    
    @IBOutlet weak var tipCalculateButton: UIButton!
    @IBOutlet weak var clearTipTextButton: UIButton!
    @IBOutlet weak var clearNumberButton: UIButton!
    
    @IBOutlet weak var topBackgroundView: UIView!
    @IBOutlet weak var bottomBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipCalculateButton.layer.cornerRadius = 15
        topBackgroundView.layer.cornerRadius = 15
        bottomBackgroundView.layer.cornerRadius = 15
        clearTipTextButton.layer.cornerRadius = 15
        clearNumberButton.layer.cornerRadius = 15
    }
    
    @IBAction func calculate(_ sender: Any) {
    
        let moneyText = moneyTextField.text!
        let tipText = tipTextField.text!
        let peopleText = peopleTextField.text!
        let money = Float(moneyText)
        let tip = Float(tipText)
        let people = Float(peopleText)
        
        if money != nil, tip != nil, people != nil {
            
            if tip == 0, people != 0 {
                let result = money! / people!
                resultLabel.text = "一人出\(result)元！"
            } else if tip != 0, people == 0 {
                let result = money! * tip! / 100
                let totalResult = money! + result
                resultLabel.text = "小費是\(result)元！總數加小費共\(totalResult)元！"
            } else if tip == 0, people == 0 {
                resultLabel.text = "不需要我計算了嗎？"
            } else {
                let tipResult = money! * tip! / 100
                let totalResult = tipResult + money!
                let result = Float(totalResult / people!)
                resultLabel.text = "小費是\(tipResult)元，總數加上小費是\(totalResult)元，平均一人要付\(result)元！"
            }
            
        } else {
            resultLabel.text = "資料輸入不完全，小費、人數不需要計算時請輸入0！"
        }
        
        view.endEditing(true)
    
    }
    
    @IBAction func calculateNumber(_ sender: UISegmentedControl) {
        
        let numberOneText = numberOneTextField.text!
        let numberTwoText = numberTwoTextField.text!
        let numberOne = Float(numberOneText)
        let numberTwo = Float(numberTwoText)
        
        if numberOne != nil, numberTwo != nil {
         
//            switch sender.selectedSegmentIndex {
//            case 0:
//                let result = numberOne! + numberTwo!
//                numberResult.text = "\(result)"
//            case 1:
//                let result = numberOne! - numberTwo!
//                numberResult.text = "\(result)"
//            case 2:
//                let result = numberOne! * numberTwo!
//                numberResult.text = "\(result)"
//            default:
//                let result = numberOne! / numberTwo!
//                numberResult.text = "\(result)"
//            }
            
//            if sender.selectedSegmentIndex == 0 {
//                let result = numberOne! + numberTwo!
//                numberResult.text = "\(result)"
//            } else if sender.selectedSegmentIndex == 1 {
//                let result = numberOne! - numberTwo!
//                numberResult.text = "\(result)"
//            } else if sender.selectedSegmentIndex == 2 {
//                let result = numberOne! * numberTwo!
//                numberResult.text = "\(result)"
//            } else if sender.selectedSegmentIndex == 3 {
//                let result = numberOne! / numberTwo!
//                numberResult.text = "\(result)"
//            }
            
            let operatorArray = [(numberOne! + numberTwo!), (numberOne! - numberTwo!), (numberOne! * numberTwo!), numberOne! / numberTwo!]
            let result = operatorArray[sender.selectedSegmentIndex]
            numberResult.text = String(format: "%.2f", result)
            
        } else {
            numberResult.text = "資料輸入不完全！"
        }
        
        view.endEditing(true)
        
    }

    @IBAction func tapViewToCloseKeyBoard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func clearTipTextField(_ sender: UIButton) {
        
        moneyTextField.text = ""
        tipTextField.text = ""
        peopleTextField.text = ""
        resultLabel.text = ""
        
    }

    @IBAction func clearNumberTextField(_ sender: UIButton) {
        
        numberOneTextField.text = ""
        numberTwoTextField.text = ""
        numberResult.text = ""
        operatorSegmentControl.selectedSegmentIndex = 0
        
    }
    
}
