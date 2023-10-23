//
//  ViewController.swift
//  FirstProject
//
//  Created by Tekla Matcharashvili on 22.10.23.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mathActions: UILabel!
    @IBOutlet weak var answers: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var controler: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateMathActionLabel()
    }

    @IBAction func switchStateChanged(_ sender: UISwitch) {
        updateMathActionLabel()
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        calculateResult()
    }

    func updateMathActionLabel() {
        if controler.isOn {
            mathActions.text = "GCD"
        } else {
            mathActions.text = "LCM"
        }
    }

    func calculateResult() {
        guard let number1 = Double(textField1.text ?? ""),
              let number2 = Double(textField2.text ?? "") else {
            answers.text = "Invalid input"
            return
        }

        if controler.isOn { 
            let result = greatestCommonDivisor(a: Int(number1), b: Int(number2))
            answers.text = "Result: \(result)"
        } else {
            let result = leastCommonMultiple(a: Int(number1), b: Int(number2))
            answers.text = "Result: \(result)"
        }
    }

    func greatestCommonDivisor(a: Int, b: Int) -> Int {
        return b == 0 ? a : greatestCommonDivisor(a: b, b: a % b)
    }

    func leastCommonMultiple(a: Int, b: Int) -> Int {
        return a * b / greatestCommonDivisor(a: a, b: b)
    }
}
