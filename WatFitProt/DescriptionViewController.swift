//
//  DescriptionViewController.swift
//  WatFitProt
//
//  Created by Karam Puneet Talwandi on 2018-06-11.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
   // @IBOutlet weak var ExerciseImg: UIImageView!
    
    @IBOutlet weak var ExerciseImg: UIImageView!
    
    @IBOutlet weak var ExerciseTxt: UITextView!
    //  @IBOutlet weak var ExerciseTxt: UITextView!
    
    @IBOutlet weak var labelSets: UILabel!
    @IBOutlet weak var labelReps: UILabel!
    var index: Int!
    var currentExc: Exercise!
    @IBAction func minusSets(_ sender: UIButton) {
        let setVal:Int? = Int(labelSets.text!)
        var tmp = setVal as! Int
        if (tmp > 1){
        tmp = tmp - 1
        labelSets.text = String(describing: tmp)
        }
    }
    
    @IBAction func plusSets(_ sender: Any) {
        let setVal:Int? = Int(labelSets.text!)
        var tmp = setVal as! Int
            tmp = tmp + 1
            labelSets.text = String(describing: tmp)
    }
    
    @IBAction func minusReps(_ sender: Any) {
        let setVal:Int? = Int(labelReps.text!)
        var tmp = setVal as! Int
        if (tmp > 1){
            tmp = tmp - 1
            labelReps.text = String(describing: tmp)
        }
    }
    
    @IBAction func plusReps(_ sender: Any) {
        let setVal:Int? = Int(labelReps.text!)
        var tmp = setVal as! Int
        tmp = tmp + 1
        labelReps.text = String(describing: tmp)
    }
    
    
    
    @IBAction func beginExercise(_ sender: Any) {
        let setValS:Int? = Int(labelSets.text!)
        var tmpS = setValS as! Int
        
        let setValR:Int? = Int(labelReps.text!)
        var tmpR = setValR as! Int
        
        currentExc.setSets(n:tmpS)
        currentExc.setReps(n:tmpR)
        
        performSegue(withIdentifier: "startExercise", sender: currentExc)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "startExercise"{
            let motionVC = segue.destination as! MotionViewController
            motionVC.currentExc = currentExc
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    
    func setProperties(){
        currentExc.setName(s:currentExc.listEx[index])
        currentExc.setDesc(s:currentExc.getDescription())
    }
    //create a new class based on index number
    //["Bench Press","OverHead Press", "Squat", "Barbell Rows", "Lat Pulldowns", "Peck Deck"]
    func setClass(numOfEx: Int)  {
        switch index {
        case 0:
            currentExc = Bench()
        case 1:
            currentExc = OverHead()
        case 2:
            currentExc = Squat()
        case 3:
            currentExc = Rows()
        case 4:
            currentExc = PullDowns()
        case 5:
            currentExc = Peck()
        default:
            currentExc = Exercise()
        }
        
        setProperties()
        
        //currentExc.desc = currentExc.descEx[]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        setClass(numOfEx: index)
        self.title = currentExc.name
        ExerciseImg.image = UIImage(named: currentExc.name!)
        ExerciseTxt.text = currentExc.getDescription()
        labelSets.text = "1"
        labelReps.text = "1"
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
