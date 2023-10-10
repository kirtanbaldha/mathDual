//
//  ModePage.swift
//  mathDual
//
//  Created by r85 on 10/10/23.
//

import UIKit

class ModePage: UIViewController {

    @IBOutlet weak var easy: UIButton!
    
    @IBOutlet weak var midum: UIButton!
    
    @IBOutlet weak var hard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func buttonSape(){
           
            hard.layer.cornerRadius = 10
            hard.layer.masksToBounds = true
            
            midum.layer.cornerRadius = 10
            midum.layer.masksToBounds = true
        }
        
        @IBAction func easyButton(_ sender: UIButton) {
            navigation()
        }
        
        @IBAction func mediumButton(_ sender: Any) {
            navigation2()
        }
        
        @IBAction func hardButton(_ sender: Any) {
            navigation3()
        }
        
        func navigation(){
            let navigate = storyboard?.instantiateViewController(withIdentifier: "finalPage") as! finalPage
            navigate.freq = 0.10
            navigationController?.pushViewController(navigate, animated: true)
        }
        
        func navigation2(){
            let navigate = storyboard?.instantiateViewController(withIdentifier: "finalPage") as! finalPage
            navigate.freq = 0.05
            navigationController?.pushViewController(navigate, animated: true)
        }
        
        func navigation3(){
            let navigate = storyboard?.instantiateViewController(withIdentifier: "finalPage") as! finalPage
            navigate.freq = 0.03
            navigationController?.pushViewController(navigate, animated: true)
        }
    }

    

   


