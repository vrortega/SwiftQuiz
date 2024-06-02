//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Vitoria Ortega on 16/05/24.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    @IBOutlet weak var timerView: UIView!
    
    let quizManager = QuizManager()
    //criando uma instancia do QuizManager dentro do QuizViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.numberOfLines = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timerView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 05.0, delay: 0, options: .curveLinear, animations: {
            self.timerView.frame.size.width = 0
        }) {(sucess) in
            self.showResults()
        }
        
        getNewQuiz()
            
        }
        
        func getNewQuiz() {
            quizManager.refreshQuiz()
            questionLabel.text = quizManager.question
            for i in 0..<quizManager.options.count {
                let option = quizManager.options[i]
                let button = answersButton[i]
                button.setTitle(option, for: .normal)
            }
            
        }
        
        func showResults() {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewcontroller = segue.destination as! ResultViewController
        //segue.destination retorna o próximo view controller que está navegando
        resultViewcontroller.totalAnswers = quizManager.totalAnswers
        resultViewcontroller.totalCorrectAnswers = quizManager.correctAnswers
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        if let index = answersButton.firstIndex(of: sender) {
        quizManager.validateAnswer(index: index)
        getNewQuiz()
        }
    }
    
    }
    
   


