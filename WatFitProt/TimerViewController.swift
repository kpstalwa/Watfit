//
//  TimerViewController.swift
//  WatFitProt
//
//  Created by Karam Puneet Talwandi on 2018-07-17.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var currentExc : Exercise?
    var totalTime = "60"
    
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var returnToExcerciseButton: UIButton!
    
    @IBOutlet weak var timeLeft: UILabel!
    
    
    @IBAction func minusSets(_ sender: UIButton) {
        let setVal:Int? = Int(setsLabel.text!)
        var tmp = setVal as! Int
        if (tmp > 1){
            tmp = tmp - 1
            setsLabel.text = String(describing: tmp)
        }
    }
    
    @IBAction func plusSets(_ sender: Any) {
        let setVal:Int? = Int(setsLabel.text!)
        var tmp = setVal as! Int
        tmp = tmp + 1
        setsLabel.text = String(describing: tmp)
    }
    
    @IBAction func minusReps(_ sender: Any) {
        let setVal:Int? = Int(repsLabel.text!)
        var tmp = setVal as! Int
        if (tmp > 1){
            tmp = tmp - 1
            repsLabel.text = String(describing: tmp)
        }
    }
    
    @IBAction func plusReps(_ sender: Any) {
        let setVal:Int? = Int(repsLabel.text!)
        var tmp = setVal as! Int
        tmp = tmp + 1
        repsLabel.text = String(describing: tmp)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer(){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
    setsLabel.text = String(describing: currentExc?.sets)
    repsLabel.text = String(describing: currentExc?.reps)
        timeLeft.text = totalTime
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
