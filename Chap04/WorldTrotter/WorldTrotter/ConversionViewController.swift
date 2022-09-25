//
//  ViewController.swift
//  WorldTrotter
//
//  Created by 김재형 on 2022/09/22.
//

import UIKit

class ConversionViewController: UIViewController {
	
	@IBOutlet var textField: UITextField!
	@IBOutlet var celsiusLabel: UILabel!
	
	var fahrenheitValue: Measurement<UnitTemperature>? {
		didSet {
			updateCelsiusLabel()
		}
	}
	
	var celsiusValue: Measurement<UnitTemperature>? {
		if let fahrenheitValue = fahrenheitValue {
			return fahrenheitValue.converted(to: .celsius)
		} else {
			return nil
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateCelsiusLabel()
		
		print("ConversionViewController loaded it view.")
	}
	
	@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
		if let textinput = textField.text, let value = Double(textinput) {
			fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
		} else {
			fahrenheitValue = nil
		}
	}
	
	@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
		textField.resignFirstResponder()
	}
	
	func updateCelsiusLabel() {
		if let celsiusValue = celsiusValue {
			celsiusLabel.text = "\(Int(celsiusValue.value))"					// Double형은 소수점 때문에 Int형으로 cast
		} else {
			celsiusLabel.text = "???"
		}
	}

}

