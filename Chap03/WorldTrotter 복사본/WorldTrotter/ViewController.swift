//
//  ViewController.swift
//  WorldTrotter
//
//  Created by 김재형 on 2022/09/22.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()

//		let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
//		let firstView = UIView(frame: firstFrame)
//		firstView.backgroundColor = UIColor.blue
//		view.addSubview(firstView)
//
//		let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
//		let secondView = UIView(frame: secondFrame)
//		secondView.backgroundColor = UIColor.green
//		firstView.addSubview(secondView)
		
		
		let colors: [CGColor] = [
			.init(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1),
			.init(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1),
			.init(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
		]
		let changeColors: [CGColor] = [
			.init(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),
			.init(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
			.init(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
		]

		let gradientLayer = CAGradientLayer()
		gradientLayer.frame  = self.view.bounds
		gradientLayer.colors = colors
		self.view.layer.addSublayer(gradientLayer)
		
		let colorAnimation = CABasicAnimation(keyPath: "colors")
		colorAnimation.toValue = changeColors
		colorAnimation.duration = 3
		colorAnimation.autoreverses = true
		colorAnimation.repeatCount = .infinity
		gradientLayer.add(colorAnimation, forKey: "colorChangeAnimation")
	}

}

