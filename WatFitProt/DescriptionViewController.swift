//
//  DescriptionViewController.swift
//  WatFitProt
//
//  Created by Karam Puneet Talwandi on 2018-06-11.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var excerciseImg: UIImageView!
    @IBOutlet weak var excerciseTxt: UITextView!
    @IBOutlet weak var labelSets: UILabel!
    @IBOutlet weak var labelReps: UILabel!
    
    @IBAction func minusSets(_ sender: UIButton) {
        let setVal:Int? = Int(labelSets.text!)
        var tmp = setVal as! Int
        if (tmp > 0){
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
        if (tmp > 0){
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
    
    @IBAction func beginExcercise(_ sender: Any) {
        let setValS:Int? = Int(labelSets.text!)
        var tmpS = setValS as! Int
        
        let setValR:Int? = Int(labelReps.text!)
        var tmpR = setValR as! Int
        
        currentExc.sets = tmpS
        currentExc.reps = tmpR
        
        performSegue(withIdentifier: "startExcercise", sender: currentExc)
    }
    
    var index: Int!
    var currentExc = Excercise()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setClass(numOfEx: Int)  {
        currentExc.name = currentExc.listEx[index]
        currentExc.desc = currentExc.descEx[index]
        //currentExc.desc = currentExc.descEx[]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        setClass(numOfEx: index)
        self.title = currentExc.name
        excerciseImg.image = UIImage(named: currentExc.name!)
        excerciseTxt.text = currentExc.descEx[index]
        labelSets.text = "0"
        labelReps.text = "0"
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
