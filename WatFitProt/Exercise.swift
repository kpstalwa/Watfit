//
//  Exercise.swift
//  WatFit
//
//  Created by Pranith Ledala on 6/5/18.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class Exercise {
    
    var name:String?
    var desc:String?
    var sets: Int? // sets and reps planned for first run
    var reps: Int?
    var completedRepsOverall: Int? //reps * sets total
    var goodRepsOverall: Int?
    
    //Motion constraints
    var staticUpper: Double?
    var staticLower: Double?
    var goodResetLower: Double?
    var goodActionUpper: Double?
    var formConstrainPitch: Double?
    
    let listEx = ["Bench Press","OverHead Press", "Squat", "Barbell Rows", "Lat Pulldowns", "Peck Deck"]
    init() {
        self.name=nil
        self.desc = nil
        self.sets = nil
        self.reps = nil
        
        self.staticUpper = nil
        self.staticLower = nil
        self.goodResetLower = nil
        self.goodActionUpper = nil
        self.formConstrainPitch = nil
        
        self.completedRepsOverall = 0
        self.goodRepsOverall = 0
        
    }
    func incrementOverallReps(){
        //as you complete a rep good or bad this is called
        completedRepsOverall = completedRepsOverall!+1
    }
    func incrementGoodReps(){
        //only good reps recorded
        goodRepsOverall = goodRepsOverall! + 1
    }
    
    func getFinalScore() -> Double{
    return (Double(goodRepsOverall!)/Double(completedRepsOverall!)) * 100
    }
    
    func getScoreStatement()->String{
        if(completedRepsOverall != 0){
            let score = getFinalScore()
            return "You completed a total of \(completedRepsOverall!) reps, out of which you performed \(goodRepsOverall!) perfectly. Your Final score is \(Int(score)), out of 100"
    }
        else{
            return "You did not finish the exercise"
        }
    }
    
    func getDescription()-> String {
        return "I will be overriden"
    }
    func recordMotion(){
        //needs to be overriden
    }
    
    func setName(s:String){
        self.name = s
    }
    func setDesc(s:String){
        self.desc = s
    }
    func setSets(n:Int){
        self.sets = n
    }
    func setReps(n:Int){
        self.reps = n
    }
}


class Bench : Exercise {
    override func getDescription() -> String {
        let descr = "Lie back on a flat bench. Using a medium width grip (a grip that creates a 90-degree angle in the middle of the movement between the forearms and the upper arms), lift the bar from the rack and hold it straight over you with your arms locked. This will be your starting position. From the starting position, breathe in and begin coming down slowly until the bar touches your middle chest. After a brief pause, push the bar back to the starting position as you breathe out."
        return descr
    }
    override func recordMotion() {
        
    }
    
    override init() {
        super.init()
        staticUpper = 0.033
        staticLower = -0.033
        goodResetLower = -0.30
        goodActionUpper = 0.30
        formConstrainPitch = 70.0
    }
}

class OverHead : Exercise {
    override func getDescription() -> String {
        let descr = "The weight is to be pressed to overhead until the elbows are fully locked out. As the weight clears the head, the lifter leans forward slightly, or comes directly under, in order to keep balance. As the weight is lowered back to racking position and clears the head again, the lifter leans slightly back. The overhead press is a highly effective compound upper-body exercise. Performing it standing recruits many more muscle groups in order to maintain balance and support the lift, rather than performing it seated."
        return descr
    }
    
    override func recordMotion() {
        
    }
    override init() {
        super.init()
        staticUpper = 0.033
        staticLower = -0.033
        goodResetLower = -0.30
        goodActionUpper = 0.30
        formConstrainPitch = 65.0
    }
}

class Squat : Exercise {
    override func getDescription() -> String {
        let descr = "Begin with the barbell supported on top of the traps. The chest should be up and the head facing forward. Adopt a hip-width stance with the feet turned out as needed.Descend by flexing the knees, refraining from moving the hips back as much as possible. This requires that the knees travel forward. Ensure that they stay align with the feet. The goal is to keep the torso as upright as possible. Continue all the way down, keeping the weight on the front of the heel. At the moment the upper legs contact the lower legs reverse the motion, driving the weight upward"
        return descr
    }
    
    override func recordMotion() {
        
    }
    override init() {
        super.init()
        staticUpper = 0.033
        staticLower = -0.033
        goodResetLower = -0.30
        goodActionUpper = 0.30
        formConstrainPitch = 70.0
    }
}

class Rows : Exercise {
    override func getDescription() -> String {
        let descr = "Holding a barbell with a pronated grip (palms facing down), bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up. The barbell should hang directly in front of you as your arms hang perpendicular to the floor and your torso. This is your starting position. Now, while keeping the torso stationary, breathe out and lift the barbell to you. Keep the elbows close to the body and only use the forearms to hold the weight. At the top contracted position, squeeze the back muscles and hold for a brief pause. Then inhale and slowly lower the barbell back to the starting position."
        return descr
    }
    
    override func recordMotion() {
        
    }
    override init() {
        super.init()
        staticUpper = 0.033
        staticLower = -0.033
        goodResetLower = -0.30
        goodActionUpper = 0.30
        formConstrainPitch = 70.0
    }
}

class PullDowns : Exercise {
    override func getDescription() -> String {
        let descr = "Sit down on a pull-down machine with a wide bar attached to the top pulley. Grab the bar with the palms facing forward using the prescribed grip. As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees. As you breathe out, bring the bar down until it touches your upper chest by drawing the shoulders and the upper arms down and back. After a second at the contracted position squeezing your shoulder blades together, slowly raise the bar back to the starting position when your arms are fully extended and the lats are fully stretched."
        return descr
    }
    
    override func recordMotion() {
        
    }
    override init() {
        super.init()
        staticUpper = 0.033
        staticLower = -0.033
        goodResetLower = -0.30
        goodActionUpper = 0.30
        formConstrainPitch = 70.0
    }
}

class Peck : Exercise {
    override func getDescription() -> String {
        let descr = "Sit on the machine with your back flat on the pad. Take hold of the handles. Tip: Your upper arms should be positioned parallel to the floor; adjust the machine accordingly. This will be your starting position. Push the handles together slowly as you squeeze your chest in the middle. Breathe out during this part of the motion and hold the contraction for a second. Return back to the starting position slowly as you inhale until your chest muscles are fully stretched."
        return descr
    }
    
    override func recordMotion() {
        
    }
    override init() {
        super.init()
        staticUpper = 0.033
        staticLower = -0.033
        goodResetLower = -0.30
        goodActionUpper = 0.30
        formConstrainPitch = 70.0
    }
}









