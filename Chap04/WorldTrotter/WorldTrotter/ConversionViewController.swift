//
//  ViewController.swift
//  WorldTrotter
//
//  Created by 김재형 on 2022/09/22.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet var textField: UITextField!
	@IBOutlet var celsiusLabel: UILabel!
	
	// 저장 프로퍼티 fahrenheitValue + 감시자
	var fahrenheitValue: Measurement<UnitTemperature>? {
		didSet {
			updateCelsiusLabel()
		}
	}
	
	// 연산 프로퍼티 celsiusValue
	var celsiusValue: Measurement<UnitTemperature>? {
		if let fahrenheitValue = fahrenheitValue {
			return fahrenheitValue.converted(to: .celsius)
		} else {
			return nil
		}
	}
	
	// numberFormatter 프로퍼티(클로저)
	let numberFormatter: NumberFormatter = {
		let nf = NumberFormatter()
		nf.numberStyle = .decimal
		nf.minimumFractionDigits = 0
		nf.maximumFractionDigits = 1
		return nf
	}()
	
	// view가 로드되면 실행(초기화)
	override func viewDidLoad() {
		super.viewDidLoad()
		updateCelsiusLabel()
		
		print("ConversionViewController loaded it view.")
	}
	
	// 텍스트필드 값이 바뀌면 ==> 저장 프로퍼티 fahrenheitValue
	@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
		if let textinput = textField.text, let value = Double(textinput) {
			fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
		} else {
			fahrenheitValue = nil
		}
	}
	
	// 텍스트필드 외 클릭하면 키보드 없애기
	@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
		textField.resignFirstResponder()
	}
	
	// 연산 프로퍼티 celsiusValue값 ==> Label값
	func updateCelsiusLabel() {
		if let celsiusValue = celsiusValue {
			celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
		} else {
			celsiusLabel.text = "???"
		}
	}
	
	// UITextFieldDelegate 프로토콜 구현
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		let existingTextSeparator = textField.text?.ranges(of: ".")
		let newTextSeparator = string.ranges(of: ".")
		if existingTextSeparator != nil && newTextSeparator != nil {
			return false
		} else {
			return true
		}
	}
}
