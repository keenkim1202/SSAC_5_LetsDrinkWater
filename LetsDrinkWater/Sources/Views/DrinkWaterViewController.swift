//
//  DrinkWaterViewController.swift
//  LetsDrinkWater
//
//  Created by KEEN on 2021/10/11.
//

import UIKit

class DrinkWaterViewController: UIViewController {
  
  // MARK: UI
  @IBOutlet weak var totalDrinkLabel: UILabel!
  @IBOutlet weak var goalLabel: UILabel!
  @IBOutlet weak var sacImageView: UIImageView!
  @IBOutlet weak var drinkAmountLabel: UITextField!
  
  // MARK: Properties
  var goal: Int = 0
  var totalDrinkAmount: Int = 0
  var perDrinkAmount: Int = 0
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: Action
  @IBAction func onDrinkButton(_ sender: Any) {
    let input: String = drinkAmountLabel.text!
    
    if let perDrink = Int(input) {
     totalDrinkAmount += perDrink
      totalDrinkLabel.text = "\(totalDrinkAmount)ml"
    }
    
  }
}


