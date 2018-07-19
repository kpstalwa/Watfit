//
//  MotionViewController.swift
//  WatFitProt
//
//  Created by Karam Puneet Talwandi on 2018-06-12.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit
import SystemConfiguration
class MotionViewController: UIViewController {
    var syncGroup = DispatchGroup()
    var timeTillStart = 3
    var timer = Timer()
    var currentExc : Exercise?
    let m = gfunction()
    
   
    @IBOutlet weak var progressImg: UIImageView!
    
    @IBOutlet weak var setLimit: UILabel!
    @IBOutlet weak var repLimit: UILabel!
    @IBOutlet weak var currentReps: UILabel!
    //incase finish button is called
    @IBAction func finishProt(_ sender: UIButton) {
        performSegue(withIdentifier: "RestPage", sender: currentExc)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RestPage" {
            let timerVC = segue.destination as! TimerViewController
            timerVC.currentExc = currentExc
        }
        else if segue.identifier == "finishExercise" {
            let scoreVC = segue.destination as! ScoreViewController
            scoreVC.currentExc = currentExc
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishExercise(_ sender: Any) {
        m.motion.stopDeviceMotionUpdates()
        
        performSegue(withIdentifier: "finishExercise", sender: currentExc)
    }
    
    
    @objc func updateTimer() {
        if(timeTillStart > 0){
        timeTillStart = timeTillStart-1
        }
        else{
            m.startRecord()
            timer.invalidate()
            syncGroup.notify(queue: .main){
                if(self.setLimit.text == "1"){
                    self.performSegue(withIdentifier: "finishExercise", sender: self.currentExc)
                }
                else{
                self.performSegue(withIdentifier: "RestPage", sender: self.currentExc)
            }
        }
    }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //motion setting
        m.staticUpper = (currentExc?.staticUpper)!
        m.StaticLower = (currentExc?.staticLower)!
        m.goodResetLower = (currentExc?.goodResetLower)!
        m.goodActionUpper = (currentExc?.goodActionUpper)!
        m.formConstrainPitch = (currentExc?.formConstrainPitch)!
        m.exercise = currentExc!
        m.quantity = (currentExc?.reps)!
        m.setUpdateInterval(time: 0.02)
        m.currentReps = currentReps
        m.syncGroup = syncGroup
        m.progressImg = progressImg
        
        //3 second wait until recording
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Perform Exercise"
        setLimit!.text! = String(describing: currentExc!.sets!)
        repLimit!.text! = String(describing: currentExc!.reps!)
        currentReps.text = "0"
        progressImg.loadGif(name: "source")
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
