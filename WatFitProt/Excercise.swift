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
    let descEx = ["This is bench press","This is OHP","This is Squat","This is BB rows","This is Lat Pulldowns","This is Peck Deck"]
    init() {
        self.name=nil
        self.desc = nil
        self.sets = nil
        self.reps = nil
    }
}
