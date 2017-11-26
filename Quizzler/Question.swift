//
//  Question.swift
//  Quizzler
//
//  Created by Fabio Quintanilha on 11/22/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    private let questionText : String
    private let answer : Bool
    
    // Initializer| Constructor
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
    public func getQuestionText() -> String {
        return questionText
    }
    
    public func getAnswer() -> Bool {
        return answer
    }

}

