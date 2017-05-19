//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//


// ~~~~~~~~~~~~~~~~~~~~~~
// ~~~~ To Do List ~~~~~~

// - add label at the top of the screen to display question number and the number of total questions
// - fix checkAnswers()
// - move functions to another file, not the viewController


// ~~~~~~~~~~~~~~~~~~~~~~

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var shownQuestion = [String]()
    
    var gameSound: SystemSoundID = 0
    
    
    
    let trivia = Questions()
    let answers = Answers()
    
    
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
        checkQuestions()      // _____ error
        displayQuestion()
        displayAnswers()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // displayQuestion() this function will pull a random question from the randomFact function inside the Questions struct
        // should possibly check if the question was already shown
    func displayQuestion() {
       let questionDisplay = trivia.randomFact()
        questionField.text = questionDisplay
        playAgainButton.isHidden = true
    }

    
    // questionField.text = trivia.randomFact()




    // displayAmswers() this function will display the correct answers for each array, and then add that question from the questionsArray to a new array called shownQuestions
    func displayAnswers() {
        if questionField.text == trivia.questionsArray[0] {             // Question One
            shownQuestion.append(trivia.questionsArray[0])
            trueButton.setTitle(answers.questionOneAnswers[0], for: .normal) // correct answer
            buttonTwo.setTitle(answers.questionOneAnswers[1], for: .normal)
            falseButton.setTitle(answers.questionOneAnswers[2], for: .normal)
            buttonFour.setTitle(answers.questionOneAnswers[3],for: .normal)
        }
        else if questionField.text == trivia.questionsArray[1] {        // Question Two
            shownQuestion.append(trivia.questionsArray[1])
            trueButton.setTitle(answers.questionTwoAnswers[0], for: .normal)
            buttonTwo.setTitle(answers.questionTwoAnswers[1], for: .normal) // correct answer
            falseButton.setTitle(answers.questionTwoAnswers[2], for: .normal)
            buttonFour.setTitle(answers.questionTwoAnswers[3],for: .normal)
        }
        else if questionField.text == trivia.questionsArray[2] {        // Question Three
            shownQuestion.append(trivia.questionsArray[2])
            trueButton.setTitle(answers.questionThreeAnswers[0], for: .normal) // correct answer
            buttonTwo.setTitle(answers.questionThreeAnswers[1], for: .normal)
            falseButton.setTitle(answers.questionThreeAnswers[2], for: .normal)
            buttonFour.setTitle(answers.questionThreeAnswers[3],for: .normal)
        }
        else if questionField.text == trivia.questionsArray[3] {        // Question Four
            shownQuestion.append(trivia.questionsArray[3])
            trueButton.setTitle(answers.questionFourAnswers[0], for: .normal)
            buttonTwo.setTitle(answers.questionFourAnswers[1], for: .normal)
            falseButton.setTitle(answers.questionFourAnswers[2], for: .normal) // correct answer
            buttonFour.setTitle(answers.questionFourAnswers[3],for: .normal)
        }
    }
    
    
    
    
    
   
    //           !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     // checkQuestions() this func will check the text in the questionField and if the displayedQuestion is equal to a question in shownQuestion (an array of questions that have already been asked) then run the displayQuestion func again, else the text in the questionField will equal the displayedQuestion
    
    func checkQuestions() {
        let displayedQuestion = questionField.text
        for question in shownQuestion {
            if displayedQuestion == question {
                displayQuestion()
            } else if displayedQuestion != question{
                questionField.text = displayedQuestion
            }
    
        }
    }


    //                  ________________________________________________________________________________
    
    
    
    // displayScore() this func will hide the answer buttons and show the play again button. when this function is called, it will display the score at the top of the screen using string interpolation
    
    func displayScore() {
        // Hide the answer buttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        buttonTwo.isHidden = true
        buttonFour.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    
    // some notes
    
    /* 
     trueButton: UIButton!     // 1st button a)
     buttonTwo: UIButton!      // 2nd button b)
     falseButton: UIButton!    // 3rd button c)
     buttonFour: UIButton!     // 4th button d)
     */
     
     
     /*
     
     switch questionField.text {
     case questionField.text == trivia.questionsArray[0]: correctAnswer = trueButton
     case trivia.questionsArray[1]: correctAnswer = buttonTwo
     case trivia.questionsArray[2]: correctAnswer = trueButton
     case trivia.questionsArray[3]: correctAnswer = falseButton
     default:
     }
     */
 
    
    // checkAnswers() this function will check if the answer button being pressed is the corresponding correct answer for the displayed question. When the correct answer is selected then the correctQuestions array is incremented by one, and will display a string saying that the user is correct, or wrong if a wrong answer is selected. when an answer is correct, the questionsAsked array is also incremented by one.
    @IBAction func checkAnswer(_ sender: UIButton) {
        // pulling an error if correct or wrong button is pressed
        var correctAnswer: UIButton = sender
        
        if questionField.text == trivia.questionsArray[0] {
            correctAnswer = trueButton
        } else if questionField.text == trivia.questionsArray[1] {
            correctAnswer = buttonTwo
        } else if questionField.text == trivia.questionsArray[2] {
            correctAnswer = trueButton
        } else if questionField.text == trivia.questionsArray[3] {
            correctAnswer = falseButton
        }
        
        // Increment the questions asked counter
        questionsAsked += 1
        if (sender === trueButton && correctAnswer == trueButton) || (sender === buttonTwo && correctAnswer == buttonTwo) || (sender === falseButton && correctAnswer == falseButton) || (sender === buttonFour && correctAnswer == buttonFour) {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 1)
    }
    
    
    // nextRound() nextRound will bring up the questions and buttons if questions asked is less than the number of questionsPerRound.
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
            checkQuestions()        // _____________
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

