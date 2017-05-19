//
//  TriviaController.swift
//  TrueFalseStarter
//
//  Created by Matthew Sousa on 5/12/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//
import GameKit

/*
 // original tivia dictionary
// need to turn this into a class or struct

let trivia: [[String : String]] = [
    ["Question": "Only female koalas can whistle", "Answer": "False"],
    ["Question": "Blue whales are technically whales", "Answer": "True"],
    ["Question": "Camels are cannibalistic", "Answer": "False"],
    ["Question": "All ducks are birds", "Answer": "True"]
]
*/


// http://www.triviaquestionsnow.com/for/science-trivia?page=6



// Questions - creates an array named questionArray which conatains all the questions for the game. the questions struct also holds a function, called randomFact(), to produce a random question. 
struct Questions {
    var questionsArray = [
        "How long does it take for light from the Sun to reach the Earth?",
        "An octopus can fit through any hole larger than its what?",
        "What was the first planet to be discovered using telescope?",
        "What is the worlds largest active volcano?"
    ]
    
    /* randomFact() :
     creates a random number with an upperbound of the number of questions in questionsArray
     */  // GKRandomSource.sharedRandom().nextInt(upperBound: questionsArray.count)
    func randomFact() -> String {
     let generatedNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questionsArray.count-1)
        let number = generatedNumber
        // prv ln: fixed error now that generatedNumber is assigned to another concstant before beign sent through questionArray
        return questionsArray[number]
    }

}

// Answers - creates four arrays, of four questions each, each dictioary corresponds to a question inside the questionsArray in the Questions struct.
struct Answers {
    let questionOneAnswers = [
        "a) 8:20 minutes", // correct answer
        "b) 7:42 minutes",
        "c) 10:00 minutes",
        "d) 9:40 minutes"
 ]
    let questionTwoAnswers = [
        "a) Tentacle",
        "b) Beak", // correct answer
        "c) Head",
        "d) Arms"
]
    
    let questionThreeAnswers = [
        "a) Uranus", // correct answer
        "b) Venus",
        "c) Jupiter",
        "d) Mars"
    ]
    
    let questionFourAnswers = [
        "a) Kilimanjaro",
        "b) Mauna Loa",
        "c) Tamu Massif", // correct answer
        "d) Sierra Negra"
]

}






























