//
//  ViewController.swift
//  BitManipulator
//
//  Created by Grygorii Tarashchuk on 07.08.2022.
//

import UIKit

class BitManViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var xTestField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xTestField.delegate = self
        self.yTextField.delegate = self
        self.xTestField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.yTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)

        // Do any additional setup after loading the view.
    }

    @IBAction func doCalculation(_ sender: Any) {
        let x = Int(self.xTestField.text ?? "0") ?? 0
        let y = Int(self.yTextField.text ?? "0") ?? 0
        self.showResult(finalvalue: self.getBitSwapCount(x: x, y: y))
        
    }
    
    func getBitSwapCount(x:Int, y:Int) -> Int{
        var count = 0;
        let z = x^y
        count = z.nonzeroBitCount

        return count;
    }
    
    func showResult(finalvalue:Int){
        self.resultLabel.text = String(finalvalue)
        UIView.animate(withDuration: 0.5) {
            self.resultLabel.alpha = 1.0
            self.resultTitleLabel.alpha = 1.0
        } completion: { Bool in
            
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.resultLabel.text = ""
        UIView.animate(withDuration: 0.5) {
            self.resultLabel.alpha = 0.0
            self.resultTitleLabel.alpha = 0.0
        } completion: { Bool in
            
        }
    }
    
}

