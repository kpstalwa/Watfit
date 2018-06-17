//
//  MotionViewController.swift
//  WatFitProt
//
//  Created by Karam Puneet Talwandi on 2018-06-12.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class MotionViewController: UIViewController {
    
    var currentExc : Excercise?

    @IBOutlet weak var setLimit: UILabel!
    @IBOutlet weak var repLimit: UILabel!
    @IBAction func finishProt(_ sender: UIButton) {
        performSegue(withIdentifier: "finishExcercise", sender: currentExc )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishExcercise" {
            let scoreVC = segue.destination as! ScoreViewController
            scoreVC.currentExc = currentExc
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Perform Excercise"
        setLimit!.text! = String(describing: currentExc!.sets!)
        repLimit!.text! = String(describing: currentExc!.reps!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
