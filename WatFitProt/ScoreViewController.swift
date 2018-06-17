//
//  ScoreViewController.swift
//  WatFitProt
//
//  Created by Karam Puneet Talwandi on 2018-06-17.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    var currentExc : Excercise?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Score"
        self.navigationController!.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
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
