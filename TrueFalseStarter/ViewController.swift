//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//


// ~~~~~~~~~~~~~~~~~~~~~~
// ~~~~ To Do List ~~~~~~

// - Refactor UI
// 
// - Refactor to MVC


// ~~~~~~~~~~~~~~~~~~~~~~

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    
    var gameSound: SystemSoundID = 0
    
    var trivia = TriviaQA()
 
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var trueButton: UIButton!     // 1st button a)
    @IBOutlet weak var falseButton: UIButton!    // 3rd button c)
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!      // 2nd button b)
    @IBOutlet weak var buttonFour: UIButton!     // 4th button d)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
        displayAnswers()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // displayQuestion() this function will pull a random question from the question bank
    func displayQuestion()  {
        let number = questionIndex
        let question = trivia.randomQuestion(questionIndex: number)
        questionField.text = question
        
        playAgainButton.isHidden = true
    }

    // displayAmswers() this function will display the correct answers for each array, and then add that question from the questionsArray to a new array called shownQuestions
    func displayAnswers() {
        let number = questionIndex
        let answersArray = trivia.getAnswers(questionIndex: number)
        trueButton.setTitle(answersArray[0], for: .normal)
        buttonTwo.setTitle(answersArray[1], for: .normal)
        falseButton.setTitle(answersArray[2], for: .normal)
        buttonFour.setTitle(answersArray[3], for: .normal)
       
    }
    
    // remove questions from question bank and added to an array of used questions
    func removeQuestion() {
        trivia.usedQuestions.append(trivia.questions[questionIndex])
        trivia.questions.remove(at: questionIndex)
    }
    
    // questions brought back to the questions bank from the used questions array
    func reviveQuestions() {
        trivia.questions.append(contentsOf: trivia.usedQuestions)
        trivia.usedQuestions.removeAll()
    }
    
    // displayScore() this func will hide the answer buttons and show the play again button. when this function is called, it will display the score at the top of the screen using string interpolation
    func displayScore() {
        // Hide the answer buttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        buttonTwo.isHidden = true
        buttonFour.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        // Display closing message
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    
    // some notes
    
    /* 
     trueButton: UIButton!     // 1st button a)
     buttonTwo: UIButton!      // 2nd button b)
     falseButton: UIButton!    // 3rd button c)
     buttonFour: UIButton!     // 4th button d)
     */
     
     
   
    // checkAnswers() this function will check if the answer button being pressed is the corresponding correct answer for the displayed question. When the correct answer is selected then the correctQuestions array is incremented by one, and will display a string saying that the user is correct, or wrong if a wrong answer is selected. when an answer is correct, the questionsAsked array is also incremented by one.
    @IBAction func checkAnswer(_ sender: UIButton) {
        
     
        
        //    (sender === trueButton && trueButton.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex)) || (sender === buttonTwo && buttonTwo.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex)) || (sender === falseButton && falseButton.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex)) || (sender === buttonFour && buttonFour.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex))
        
/*
 
         var choice: UIButton = sender
         
         if questionField.text == trivia.randomQuestion(qustionIndex: questionIndex) {
         correctAnswer = trivia.correctAnswer(questionIndex: questionIndex)
    
         }
         
         
         MARCH 17 1:10 AM
         (sender === trueButton && correctAnswer == trueButton) || (sender === buttonTwo && correctAnswer == buttonTwo) || (sender === falseButton && correctAnswer == falseButton) || (sender === buttonFour && correctAnswer == buttonFour)
         
         
        ~~~~~~
         var correctAnswer: UIButton = sender
         
         if questionField.text == trivia.randomQuestion(questionIndex: 0) {
         correctAnswer = trueButton
         } else if questionField.text == trivia.randomQuestion(questionIndex: 1) {
         correctAnswer = buttonTwo
         } else if questionField.text == trivia.randomQuestion(questionIndex: 2) {
         correctAnswer = trueButton
         } else if questionField.text == trivia.randomQuestion(questionIndex: 3) {
         correctAnswer = falseButton
         }
         
         
 */
        
        // Increment the questions asked counter
        questionsAsked += 1
      
        if  (sender === trueButton && trueButton.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex)) ||
            (sender === buttonTwo && buttonTwo.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex)) ||
            (sender === falseButton && falseButton.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex)) ||
            (sender === buttonFour && buttonFour.titleLabel!.text == trivia.correctAnswer(questionIndex: questionIndex)) {
            
            correctQuestions += 1
            
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        // remove question from question bank
        removeQuestion()
        loadNextRoundWithDelay(seconds: 1)
    }
    
    
    
    // nextRound() nextRound will bring up the questions and buttons if questions asked is less than the number of questionsPerRound.
    func nextRound() {
        if questionsAsked == questionsPerRound {
                            // Game is over
            
            displayScore()
        } else {            // Continue game
           
            // choose random number
            trivia.getRandomNumber()
            
            // use random number to choose and  display quesetion and answer pairs
            displayQuestion()
            displayAnswers()
        }
    }
    
    
    // setting the playAgains action to show the answer buttons after play again is pressed. questions asked and correct questions are reset to 0, and the nextRound method is called.
        @IBAction func playAgain() {
        // Show the answer buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        buttonFour.isHidden = false
        buttonTwo.isHidden = false
            
            // fill question bank
            reviveQuestions()
            
        questionsAsked = 0
        correctQuestions = 0
        
        nextRound()
    }

    // MARK: Helper Methods

    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

