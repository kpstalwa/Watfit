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
    let descEx = ["Lie back on a flat bench. Using a medium width grip (a grip that creates a 90-degree angle in the middle of the movement between the forearms and the upper arms), lift the bar from the rack and hold it straight over you with your arms locked. This will be your starting position. From the starting position, breathe in and begin coming down slowly until the bar touches your middle chest. After a brief pause, push the bar back to the starting position as you breathe out.","This is OHP","This is Squat","This is BB rows","This is Lat Pulldowns","This is Peck Deck"]
    init() {
        self.name=nil
        self.desc = nil
        self.sets = nil
        self.reps = nil
    }
}
