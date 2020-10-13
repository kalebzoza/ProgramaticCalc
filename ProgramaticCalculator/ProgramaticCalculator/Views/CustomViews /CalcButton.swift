//
//  CalcButton.swift
//  ProgramaticCalculator
//
//  Created by Kaleb  Carrizoza on 10/13/20.
//

import UIKit

class CalcButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }

    func setUpView() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
        
        setTitleColor(.white, for: .selected)
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func toggleButton(selected:Bool) {
        isSelected = selected
        
        if isSelected {
            backgroundColor = .primaryColor()
        }else {
            backgroundColor = .secondaryColor()
        }
    }
}
