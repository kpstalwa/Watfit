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
    var totalTime = 60
    var timer = Timer()
    
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
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
    //call when timer expires or button pressed
    func setExerciseProperties(){
        let setVal:Int? = Int(setsLabel.text!)
        let repVal:Int? = Int(repsLabel.text!)
        currentExc?.sets = setVal
        currentExc?.reps = repVal
    }
    
    @IBAction func continueExercise(_ sender: Any) {
       setExerciseProperties()
        //should perform segue
        performSegue(withIdentifier: "continueExercise", sender: currentExc)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func updateTimer(){
        if(totalTime>0){
        totalTime = totalTime-1
        timeLeft.text = "\(totalTime)"
        }
        else{
            timer.invalidate()
            setExerciseProperties()
            //perform segue
            performSegue(withIdentifier: "continueExercise", sender: currentExc)
        }
    }
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continueExercise"{
            let motionVC = segue.destination as! MotionViewController
            motionVC.currentExc = currentExc
        }
        else if (segue.identifier == "finishExercise"){
            let scoreVC = segue.destination as! ScoreViewController
            scoreVC.currentExc = currentExc
        }
    }
    
    @IBAction func finishExercise(_ sender: Any) {
        performSegue(withIdentifier: "finishExercise", sender: currentExc)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
        setsLabel.text = String(describing: (currentExc?.sets)!-1)
    repsLabel.text = String(describing: (currentExc?.reps)!)
    timeLeft.text = "\(totalTime)"
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
