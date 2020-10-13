//
//  CalcTextField.swift
//  ProgramaticCalculator
//
//  Created by Kaleb  Carrizoza on 10/13/20.
//

import UIKit

class CalcTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .secondaryColor()
        textColor = .white
        
        layer.masksToBounds = true
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryColor().cgColor
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}
