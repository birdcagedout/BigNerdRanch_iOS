//
//  ViewController.swift
//  Quiz
//
//  Created by 김재형 on 2022/09/19.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var questionLabel: UILabel!
	@IBOutlet var answerLabel: UILabel!
	
	let questions: [String] = [
		"What is 7+7 ?",
		"What is the captital is Vermont",
		"What is cognac made from"
	]
	
	let answers: [String] = [
		"14",
		"Montpelier",
		"Grapes"
	]
	var currentQuestionIndex: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		questionLabel.text = questions[currentQuestionIndex]
	}
	
	
	@IBAction func showNextQuestion(_ sender: UIButton) {
		currentQuestionIndex += 1
		if currentQuestionIndex == questions.count {
			currentQuestionIndex = 0
		}
		
		let question: String = questions[currentQuestionIndex]
		questionLabel.text = question
		answerLabel.text = "???"
	}
	
	@IBAction func showAnswer(_ sender: UIButton) {
		let answer: String = answers[currentQuestionIndex]
		answerLabel.text = answer
	}
}

