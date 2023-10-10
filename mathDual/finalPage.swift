//
//  finalPage.swift
//  mathDual
//
//  Created by r85 on 10/10/23.
//

import UIKit

class finalPage: UIViewController {
    var time = Timer()
    var freq = 0.0
    var ans = 0
    var scor = 0
    var point = 0
    var null = 0
    var highscore = UserDefaults.standard.integer(forKey: "highscore")
    var button2 = Int.random(in: -100...100)
    var button3 = Int.random(in: -100...100)
    

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var labelForOperator: UILabel!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var pg: UIProgressView!
    @IBOutlet weak var h1: UIImageView!
    @IBOutlet weak var h2: UIImageView!
    @IBOutlet weak var h3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pg.progress = 1.0
        Progress()
        genret()
        buttonInText()
        scoreLbSet()
        scorUpdate()
        scor = point
        self.scorUpdate()
        
        
    }
    func pro(){
        var a : Float = 1.0
        time.invalidate()
        time = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { _ in
            a -= 0.01
            self.pg.progress = a
            if self.pg.progress == 0.0{
                self.pg.progress = 1.0
                self.time.invalidate()
                self.scorUpdate()
                self.alert()
                
            }
        })
    }
    func alert(){
        let alert = UIAlertController.init(title: "Game Over", message: "score : \(scor)\n high score : \(highscore)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "home", style: .default, handler: { _ in
            self.navigation()
        }))
        alert.addAction(UIAlertAction(title: "restart", style: .default, handler: { _ in
            self.pg.progress
        }))
        present(alert, animated: true)
    }
    
    func navigation(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "startingPage") as! startingPage
        navigationController?.popViewController(animated: false)
    }
    
    func scoreLbSet(){
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.layer.masksToBounds = true
    }
    func genret(){
        var firstNumber = Int.random(in: 1...50)
        var secondNumber = Int.random(in: 21...70)
        var array = ["+","-"]
        var opretor = array.randomElement()
        l1.text = "\(firstNumber)"
        l2.text = "\(secondNumber)"
        labelForOperator.text = opretor
        
        if labelForOperator.text == "+"{
            ans = firstNumber + secondNumber
        }else {
            ans = firstNumber - secondNumber
        }
    }
    public func buttonInText(){
        var arr = [ans,button2,button3]
        arr.shuffle()
        b1.setTitle("\(arr[0])", for: .normal)
        b2.setTitle("\(arr[1])", for: .normal)
        b3.setTitle("\(arr[2])", for: .normal)
        
    }
    func scorUpdate(){
        if scor > highscore{
            highscore = scor
        }
    }
    
    @IBAction func button1(_ sender: UIButton) {
        if let str = sender.currentTitle,let intData = Int(str),ans == intData{
            scor = scor + 1
            scoreLabel.text = "\(scor)"
            Progress()
            self.genret()
            buttonInText()
            null = 0
            h1.image = UIImage(systemName: "heart.fill")
            h2.image = UIImage(systemName: "heart.fill")
            h3.image = UIImage(systemName: "heart.fill")
        }
       
        
        else{
            null += 1
             if null == 1 {
                h1.image = UIImage(systemName: "heart")
                null += 0
             }
             else if null == 2 {
                 h2.image = UIImage(systemName: "heart")
                 null += 0
                 print(null)
              }
             else if null == 3 {
                 h3.image = UIImage(systemName: "heart")
                 alert()
                 
              }
        }
    }
}

