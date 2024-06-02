//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Vitoria Ortega on 16/05/24.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var answeredLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answeredLabel.text = "Perguntas respondidas: \(totalAnswers)"
        correctLabel.text = "Perguntas corretas: \(totalCorrectAnswers)"
        wrongLabel.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers * 100/totalAnswers
        scoreLabel.text = "\(score)%"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTouchReset(sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
}
