//
//  QuestionViewController.swift
//  DMA064_PersonalityTestFortune
//
//  Created by Dana Runge on 4/26/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionIndex = 5
    var answersChosen: [Answer] = []
    var runningScore: AnswerWeights = .init()
    func nextQuestion() {
        print(runningScore)
        // print(answersChosen)
    }
    
    @IBOutlet var questionLabel: UILabel!
    
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleQuestion00: UIButton!
    @IBOutlet var singleQuestion01: UIButton!
    @IBOutlet var singleQuestion02: UIButton!
    @IBOutlet var singleQuestion03: UIButton!
    @IBOutlet var singleQuestion04: UIButton!
    @IBOutlet var singleQuestion05: UIButton!
    @IBOutlet var singleQuestion06: UIButton!
    @IBOutlet var singleQuestion07: UIButton!
    @IBOutlet var singleQuestion08: UIButton!
    @IBOutlet var singleQuestion09: UIButton!
    @IBOutlet var singleQuestion10: UIButton!
    @IBOutlet var singleQuestion11: UIButton!
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        var answer:Answer?
        switch sender {
        case singleQuestion00:
            answer = currentAnswers[0]
        case singleQuestion01:
            answer = currentAnswers[1]
        case singleQuestion02:
            answer = currentAnswers[2]
        case singleQuestion03:
            answer = currentAnswers[3]
        case singleQuestion04:
            answer = currentAnswers[4]
        case singleQuestion05:
            answer = currentAnswers[5]
        case singleQuestion06:
            answer = currentAnswers[6]
        case singleQuestion07:
            answer = currentAnswers[7]
        case singleQuestion08:
            answer = currentAnswers[8]
        case singleQuestion09:
            answer = currentAnswers[9]
        case singleQuestion10:
            answer = currentAnswers[10]
        case singleQuestion11:
            answer = currentAnswers[11]
        default:
            break
        }
        answersChosen.append(answer!)
        runningScore = runningScore.weightAndSum(weight: currentQuestion.weight, sum: answer!.score)
        nextQuestion()
    }
    
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel0: UILabel!
    @IBOutlet var multiSwitch0: UISwitch!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        if multiSwitch0.isOn {
            answersChosen.append(currentAnswers[0])
            runningScore = runningScore.weightAndSum(weight: currentQuestion.weight, sum: currentAnswers[0].score)
        }
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[1])
            runningScore = runningScore.weightAndSum(weight: currentQuestion.weight, sum: currentAnswers[1].score)
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[2])
            runningScore = runningScore.weightAndSum(weight: currentQuestion.weight, sum: currentAnswers[2].score)
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[3])
            runningScore = runningScore.weightAndSum(weight: currentQuestion.weight, sum: currentAnswers[3].score)
        }
        nextQuestion()
    }
    
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel0: UILabel!
    @IBOutlet var rangedLabel0Alt: UILabel!
    @IBOutlet var rangedSlider0: UISlider!
    @IBOutlet var rangedLabelStack1: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel1Alt: UILabel!
    @IBOutlet var rangedSlider1: UISlider!
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        // TODO
        
        let currentQuestion = questions[questionIndex]
        for currentAnswer in currentQuestion.answers {
            let score = currentAnswer.score.rangedAnswer(slider:rangedSlider0.value, width:currentQuestion.width!)
            runningScore = runningScore.weightAndSum(weight: currentQuestion.weight, sum: score)
        }
        nextQuestion()
    }
    
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)

        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
 
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleQuestion00.setTitle(answers[0].text, for: .normal)
        singleQuestion01.setTitle(answers[1].text, for: .normal)
        singleQuestion02.setTitle(answers[2].text, for: .normal)
        singleQuestion03.setTitle(answers[3].text, for: .normal)
        singleQuestion04.setTitle(answers[4].text, for: .normal)
        singleQuestion05.setTitle(answers[5].text, for: .normal)
        if answers.count > 6 {
            singleQuestion06.setTitle(answers[6].text, for: .normal)
            singleQuestion06.isHidden = false
            singleQuestion07.setTitle(answers[7].text, for: .normal)
            singleQuestion07.isHidden = false
            singleQuestion08.setTitle(answers[8].text, for: .normal)
            singleQuestion08.isHidden = false
            singleQuestion09.setTitle(answers[9].text, for: .normal)
            singleQuestion09.isHidden = false
            singleQuestion10.setTitle(answers[10].text, for: .normal)
            singleQuestion10.isHidden = false
            singleQuestion11.setTitle(answers[11].text, for: .normal)
            singleQuestion11.isHidden = false
        } else {
            singleQuestion06.isHidden = true
            singleQuestion07.isHidden = true
            singleQuestion08.isHidden = true
            singleQuestion09.isHidden = true
            singleQuestion10.isHidden = true
            singleQuestion11.isHidden = true
        }
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch0.isOn = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiLabel0.text = answers[0].text
        multiLabel1.text = answers[1].text
        multiLabel2.text = answers[2].text
        multiLabel3.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabel0.text = answers[0].text
        rangedLabel0Alt.text = answers[0].alt!
        if answers.count > 1 {
            rangedLabelStack1.isHidden = false
            rangedLabel1.text = answers[1].text
            rangedLabel1Alt.text = answers[1].alt!
        } else {
            rangedLabelStack1.isHidden = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
