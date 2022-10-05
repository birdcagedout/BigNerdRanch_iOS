//
//  ViewController.swift
//  WorldTrotter
//
//  Created by 김재형 on 2022/09/22.
//

import UIKit


// TextField의 이벤트를 처리하는 delegate객체 = 현재의 뷰컨트롤러 객체인 ConversionViewController
// 이렇게 하기 위해 UITextFieldDelegate 프로포콜을 준수하도록
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
		
//		print("ConversionViewController loaded it view.")
		
		// 현재 locale 테스트
//		let currentLocale = Locale.current
//		let isMetric = currentLocale.usesMetricSystem
//		let isMetric = currentLocale.measurementSystem.identifier
//		let currencySymbol = currentLocale.currencySymbol
//		print(isMetric, currencySymbol)								// 대한민국: metric Optional("₩"), 스페인: metric Optional("€")
	}
	
	// 텍스트필드 값이 바뀌면 ==> 저장 프로퍼티 fahrenheitValue에 저장
	@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
		if let textinput = textField.text, let number = numberFormatter.number(from: textinput) {
			fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
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
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString newString: String) -> Bool {
		
		// 소수점 중복 방지
		let currentLocale = Locale.current
		let localeSeparator = currentLocale.decimalSeparator ?? "."					// 1000단위 자리표(없으면 .)
		
		let existingTextSeparator = textField.text?.range(of: localeSeparator)		// 원래 텍스트필드에 .이 없으면 nil
		let newTextSeparator = newString.range(of: localeSeparator)					// 새로운 텍스트필드 입력에 .이 없으면 nil

		if existingTextSeparator != nil && newTextSeparator != nil {				// 원래 텍스트필드에 .이 있고, 새로운 입력에도 .이 있으면 ==> 입력 거부
			return false
		}
		
		// 알파벳 걸러내기
		let alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		let alphaCharacters = CharacterSet(charactersIn: alpha)
		guard newString.rangeOfCharacter(from: alphaCharacters) == nil else {
			return false
		}
		
		return true
	}
}
