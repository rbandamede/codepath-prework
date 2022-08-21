//
//  ViewController.swift
//  Prework
//
//  Created by Rishika Bandamede on 8/18/22.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partySizeStepLabel: UILabel!
    
    @IBOutlet weak var eachPersonLabel: UILabel!
    
    
    private let imageView : UIImageView  = {
        let imageView = UIImageView(frame: CGRect(x: 120, y: 650, width: 180, height: 144))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageView)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        imageView.frame = CGRect(x: <#T##Double#>, y: <#T##Double#>, width: <#T##Double#>, height: <#T##Double#>)
//
//    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        partySizeStepLabel.text = String(sender.value)
        calculateTip(sender)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let partySize = Double(partySizeStepLabel.text!) ?? 0
        
        //Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let split = total / partySize
        
        //Update tip amount label
        tipAmountLabel.text = String(format : "$%.2f", tip)
        //Update total amount
        totalLabel.text = String(format : "$%.2f", total)
        eachPersonLabel.text = String(format :"$%.2f", split )
    }
    
}

