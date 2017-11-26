//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var numOfQuestions : Int = 1
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startQuiz()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            pickedAnswer = true
            break
        case 2:
            pickedAnswer = false
            break
        default:
            break
        }
        //The method below will compare the picked Answer with the right answer
        checkAnswer()
        
        if (questionNumber < numOfQuestions - 1){
            nextQuestion()
        }
        else {
            print("End of the Quiz")
            endOfQuizAlert()
        }
        
    }
    
    
    //method updates the Score Label
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
    
    
    //Method updates progress label
    func updateProgressLabel() {
        progressLabel.text = "\(questionNumber + 1) / \(numOfQuestions)"
    }
    
    
    //Method updates the progress bar
    func updateProgressBar(){
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(numOfQuestions)) * CGFloat(questionNumber + 1)
    }
    
    
    func checkAnswer() {
        
        let question = allQuestions.list[questionNumber]
        let answer = question.getAnswer()
        
        if ( pickedAnswer == answer) {
            ProgressHUD.showSuccess("Correct!")
            score += 1
            updateScoreLabel()
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    // the methos gett the list of all Questions and set a question choosen to the label
    func quizQuestion(questionNumber : Int) {
        let question = allQuestions.list[questionNumber]
        questionLabel.text = question.getQuestionText()
    }
    
    
    // The method gets the first question to start the  quiz
    func startQuiz() {
        score = 0
        questionNumber = 0
        numOfQuestions = allQuestions.list.count
        updateScoreLabel()
        updateProgressLabel()
        updateProgressBar()
        quizQuestion(questionNumber: questionNumber)
    }
    
    
    // the method update the questionNumber and gets a next question
    func nextQuestion() {
        questionNumber += 1
        updateProgressLabel()
        updateProgressBar()
        quizQuestion(questionNumber: questionNumber)
    }
    
    
    // The method creates an alert on the end of the quiz
    func endOfQuizAlert () {
        // create an alert
        let alert = UIAlertController(title: "Awesome", message: "You finished all the questions, do you want to start over?", preferredStyle:.alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
            
            self.startQuiz()
        })
        
        // Add the action to the alert
        alert.addAction(restartAction)
        
        //Present the alert o the viewer / screen
        present(alert, animated: true, completion: nil)
    }
    
}
