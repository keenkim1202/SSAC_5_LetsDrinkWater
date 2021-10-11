//
//  DrinkWaterViewController.swift
//  LetsDrinkWater
//
//  Created by KEEN on 2021/10/11.
//

import UIKit

class DrinkWaterViewController: UIViewController {
  
  // MARK: UI
  @IBOutlet weak var drunkenLabel: UILabel!
  @IBOutlet weak var goalLabel: UILabel!
  @IBOutlet weak var sacImageView: UIImageView!
  @IBOutlet weak var drinkAmountLabel: UITextField!
  @IBOutlet weak var dailyAmountLabel: UILabel!
  
  // MARK: Properties
  var goal: Double = 0
  var drunken: Double = 0
  var totalDrink: Double = 0
  var perDrink: Int = 0
  var name: String = ""
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    dailyAmountLabel.text = "프로필을 설정해주세요 :>"
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    print("mainVC - ", name, totalDrink)
    if !name.isEmpty  {
      dailyAmountLabel.text = "\(name)님 하루 물 권장 섭취량은 \(totalDrink)L 입니다."
    } else {
      print(UserDefaults.standard.string(forKey: "usrNickName") ?? "none")
      dailyAmountLabel.text = "프로필을 다시 설정해주세요 :<"
    }
  }
  
  // MARK: Action
  @IBAction func onDrinkButton(_ sender: UIBarButtonItem) {
    let input: String = drinkAmountLabel.text!
    // 물 섭취량
    if let perDrink = Double(input) {
      drunken += perDrink
      drunkenLabel.text = "\(drunken)ml"
    }
    // 목표량
    goal = (drunken / (totalDrink * 1000)) * 100
    
    print(totalDrink, drunken, goal)
    if goal >= 100 {
      goalLabel.textColor = .yellow
      goalLabel.text = "목표의 \(goal)%"
    } else {
      goalLabel.text = "목표의 \(goal)%"
    }
    
    changeImage(goal)
  }
  
  func changeImage(_ goal: Double) {
    let grade = floor(goal / 10)
    switch grade {
    case 0, 1:
      sacImageView.image = UIImage(named: "1-1")
    case 2:
      sacImageView.image = UIImage(named: "1-2")
    case 3:
      sacImageView.image = UIImage(named: "1-3")
    case 4:
      sacImageView.image = UIImage(named: "1-4")
    case 5:
      sacImageView.image = UIImage(named: "1-5")
    case 6:
      sacImageView.image = UIImage(named: "1-6")
    case 7:
      sacImageView.image = UIImage(named: "1-7")
    case 8:
      sacImageView.image = UIImage(named: "1-8")
    case 9:
      sacImageView.image = UIImage(named: "1-9")
    default:
      sacImageView.image = UIImage(named: "1-1")
    }
  }
  
  @IBAction func onReset(_ sender: UIBarButtonItem) {
    drunkenLabel.text = "0.0ml"
    goalLabel.textColor = .white
    goalLabel.text = "목표의 0%"
  }
  
  @IBAction func onProfileButton(_ sender: UIBarButtonItem) {
    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileVC") as? ProfileViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}


