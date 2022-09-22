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
		
		let layer1: CALayer = CALayer()
		layer1.frame = .init(x: 10, y: 10, width: 100, height: 100)
		layer1.backgroundColor = UIColor.red.cgColor
		view.addSubview(layer1)
		
		let layer2: CALayer = CALayer()
		layer2.frame = .init(
	}

}

