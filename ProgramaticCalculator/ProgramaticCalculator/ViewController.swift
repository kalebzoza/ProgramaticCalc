//
//  ViewController.swift
//  ProgramaticCalculator
//
//  Created by Kaleb  Carrizoza on 10/13/20.
//

import UIKit

class ViewController: UIViewController {

   

    let tenPercentButton: CalcButton = {
        let button = CalcButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.primaryColor(), for: .normal)
        button.backgroundColor = .secondaryColor()
        return button
    }()
    
    let fifteenPercentButton: CalcButton = {
        let button = CalcButton()
        button.setTitle("15%", for: .normal)
        button.setTitleColor(.primaryColor(), for: .normal)
        button.backgroundColor = .secondaryColor()
        return button
    }()
    
    let twentyPercentButton: CalcButton = {
        let button = CalcButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.primaryColor(), for: .normal)
        button.backgroundColor = .secondaryColor()
        return button
    }()
    
    let calculateButton: CalcButton = {
        let button = CalcButton()
        button.setTitle("Calculate Tip", for: .normal)
        button.backgroundColor = .primaryColor()
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let amountTextField: CalcTextField = {
        let tf  = CalcTextField()
        tf.placeholder = "Enter bill"
        tf.layer.sublayerTransform = CATransform3DMakeTranslation(7.5, 0, 0)
        return tf
    }()
    
    var tipPercent: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPercentButton.addTarget(self, action: #selector(tipButtonTapped), for: .touchUpInside)
        fifteenPercentButton.addTarget(self, action: #selector(tipButtonTapped), for: .touchUpInside)
        twentyPercentButton.addTarget(self, action: #selector(tipButtonTapped), for: .touchUpInside)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    func setupView() {
        let button = [tenPercentButton, fifteenPercentButton, twentyPercentButton, calculateButton]
        
        view.backgroundColor = .backgroundColor()
        
        view.addSubview(tenPercentButton)
        view.addSubview(fifteenPercentButton)
        view.addSubview(twentyPercentButton)
        view.addSubview(calculateButton)
        view.addSubview(amountTextField)
        view.addSubview(totalLabel)
        
    
        
        for button in button {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        
        fifteenPercentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tenPercentButton.bottomAnchor.constraint(equalTo: fifteenPercentButton.topAnchor, constant: -20).isActive = true
        twentyPercentButton.topAnchor.constraint(equalTo: fifteenPercentButton.bottomAnchor, constant: 20).isActive = true
        calculateButton.topAnchor.constraint(equalTo: twentyPercentButton.bottomAnchor, constant: 70).isActive = true
        
        totalLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor).isActive = true
        totalLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        totalLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        totalLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        amountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        amountTextField.bottomAnchor.constraint(equalTo: tenPercentButton.topAnchor, constant: -50).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        amountTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    


    @objc func tipButtonTapped(sender: CalcButton) {
        let buttons = [tenPercentButton,fifteenPercentButton, twentyPercentButton]
        
        for button in buttons {
            button.toggleButton(selected: false)
        }
        
        sender.toggleButton(selected: true)
        
        switch sender {
        case tenPercentButton:
            tipPercent = 0.1
        case fifteenPercentButton:
            tipPercent = 0.15
        case twentyPercentButton:
            tipPercent = 0.2
        default: tipPercent = 0.0
        }
    }

    @objc func calculateButtonTapped() {
        guard let amountString = amountTextField.text, !amountString.isEmpty else { return }
        guard let amount = Double(amountString) else { return }
        
        if tipPercent > 0 {
            let tipAmount = amount * tipPercent
            let total = amount + tipAmount
            let finalTip = String(format: "%.2f", tipAmount)
            let finalTotal = String(format: "%.2f", total)
            
            totalLabel.text = "Tip: \(finalTip) \n\nTotal: \(finalTotal)"
        }
    }

}//end class

