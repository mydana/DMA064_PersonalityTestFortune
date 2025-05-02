//
//  ResultsViewController.swift
//  DMA064_PersonalityTestFortune
//
//  Created by Dana Runge on 4/26/25.
//

import UIKit

class ResultsViewController: UIViewController {
    let totalScore: AnswerWeights
    
    init?(coder: NSCoder, totalScore: AnswerWeights) {
        self.totalScore = totalScore
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateFortune()
        navigationItem.hidesBackButton = true
    }
    
    func calculateFortune () {
        var element = ElementType.earth
        var score:Float = self.totalScore.earth!
        if score < self.totalScore.air! {
            element = ElementType.air
            score = self.totalScore.air!
        }
        if score < self.totalScore.fire! {
            element = ElementType.fire
            score = self.totalScore.fire!
        }
        if score < self.totalScore.water! {
            element = ElementType.water
            score = self.totalScore.water!
        }
        
        resultAnswerLabel.text = "\(element.rawValue)\(String(describing: element).uppercased())\(element.rawValue)"
        resultDefinitionLabel.text = element.definition
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
