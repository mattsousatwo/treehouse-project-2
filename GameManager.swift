//
//  ViewStorage.swift
//  TrueFalseStarter
//
//  Created by Matthew Sousa on 5/16/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


import GameKit

var questionIndex = Int()

struct quizStructure {
    let question: String
    let answers: [String]
    let correctAnswer: String
}

    // question bank of question, answer, correct answer tuples
struct TriviaQA {
    var questions: [quizStructure] = [
        quizStructure(question: "How long does it take for light from the Sun to reach the Earth?",
                      answers: ["a) 8:20 minutes", "b) 7:42 minutes", "c) 10:00 minutes", "d) 9:40 minutes"],
                      correctAnswer: "a) 8:20 minutes"),
        quizStructure(question: "An octopus can fit through any hole larger than its what?",
                      answers: ["a) Tentacle","b) Beak", "c) Head", "d) Arms"],
                      correctAnswer: "b) Beak"),
        quizStructure(question: "What was the first planet to be discovered using a telecope?",
                      answers: ["a) Uranus","b) Venus","c) Neptune","d) Mars"],
                      correctAnswer: "a) Uranus"),
        quizStructure(question: "What is the worlds largest active volcano?",
                      answers: ["a) Kilimanjaro", "b) Mauna Loa", "c) Tamu Massif", "d) Sierra Negra"],
                      correctAnswer: "c) Tamu Massif"),
        quizStructure(question: "Which planet has the most moons?",
                      answers: ["a) Earth","b) Jupiter","c) Saturn","d) Mercury"],
                      correctAnswer: "b) Jupiter"),
        quizStructure(question: "What is the capital of Australia?",
                      answers: ["a) Sydney", "b) Melbourne", "c) Canberra", "d) Brisbane"],
                      correctAnswer: "c) Canberra"),
        quizStructure(question: "If a bone is navicular, then that bone is what shape?",
                      answers: ["a) Shaped like a \"U\"", "b) Shaped like an oval", "c) Shaped like a boat", "d) Shaped like a triangle"],
                      correctAnswer: "c) Shaped like a boat"),
        quizStructure(question: "What part of the body is your \"oxter\"?",
                      answers: ["a) Your chest", "b) Your armpit", "c) Your spine", "d) Your neck"],
                      correctAnswer: "b) Your armpit")
    ]
    
    
    // func to get random question
    func getRandomNumber() {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        questionIndex = randomNumber
    }
    
    // func to pull a question out of the Trivia Pool
    func randomQuestion(questionIndex: Int) -> String {
        let chosenQAKey = questions[questionIndex]
        return chosenQAKey.question
    }
    
    // func to get answers for the generated question
    func getAnswers(questionIndex: Int) -> [String] {
        let chosenQuestion = questions[questionIndex]
        return chosenQuestion.answers
    }
    
    // func to pull correct answer
    func correctAnswer(questionIndex: Int) -> String {
        let selectedQuestion = questions[questionIndex]
        return selectedQuestion.correctAnswer
    }
    
    // array of used questions and answer tuples
    var usedQuestions: [quizStructure] = []
    
}

