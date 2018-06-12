//
//  Excercise.swift
//  WatFit
//
//  Created by Pranith Ledala on 6/5/18.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class Excercise {
    
    var name:String?
    var desc:String?
    var sets: Int?
    var reps: Int?
    let listEx = ["Bench Press","OverHead Press", "Squat", "Barbell Rows", "Lat Pulldowns", "Peck Deck"]
    init(name:String, desc:String, sets:Int, reps:Int) {
        self.name=name
        self.desc = desc
        self.sets = sets
        self.reps = reps
    }
}
