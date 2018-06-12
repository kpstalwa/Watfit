//
//  ViewController.swift
//  WatFitProt
//
//  Created by Karam Puneet Talwandi on 2018-06-11.
//  Copyright © 2018 GTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    let excercises = ["Bench Press","OverHead Press", "Squat", "Barbell Rows", "Lat Pulldowns", "Peck Deck"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return excercises.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.cellImage.image = UIImage(named: excercises[indexPath.row])
        cell.cellLabel.text = excercises[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: excercises[indexPath.row] )
        print("You selected cell #\(indexPath.item)!")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let descripVC = segue.destination as! DescriptionViewController
            let excerciseName = sender as! String
            descripVC.name = excerciseName
        }
    }
    
   

    
}

