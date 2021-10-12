//
//  DrinkWaterViewController.swift
//  LetsDrinkWater
//
//  Created by KEEN on 2021/10/11.
//

import UIKit

class DrinkWaterViewController: UIViewController {
  
  // MARK: UI
  @IBOutlet weak var congratsLabel: UILabel!
  @IBOutlet weak var drunkenLabel: UILabel!
  @IBOutlet weak var goalLabel: UILabel!
  @IBOutlet weak var sacImageView: UIImageView!
  @IBOutlet weak var drinkAmountLabel: UITextField!
  @IBOutlet weak var dailyAmountLabel: UILabel!
  
  // MARK: Properties
  var goal: Double = 0
  var drunken: Double = 0
  var perDrink: Int = 0
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    congratsLabel.textColor = .clear
    UserDefaults.standard.set(1, forKey: "imageGrade")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.setImageAnimation()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    self.setImageOriginal()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    let userName = UserDefaults.standard.string(forKey: "nickname")
    
    if userName != nil  {
      let userName = UserDefaults.standard.string(forKey: "nickname")!
      let userTotal = UserDefaults.standard.string(forKey: "total")!
      dailyAmountLabel.textColor = .white
      dailyAmountLabel.font = .systemFont(ofSize: 14)
      dailyAmountLabel.text = "\(userName)님 하루 물 권장 섭취량은 \(userTotal)L 입니다."
    } else {
      dailyAmountLabel.text = "⚠️ 프로필을 설정해주세요 :>"
      dailyAmountLabel.textColor = .systemYellow
      dailyAmountLabel.font = .boldSystemFont(ofSize: 20)
    }
  }
  
  // MARK: Alert
  fileprivate func drankAlert(_ message: String) {
    UIAlertController.show(self, contentType: .drank, message: message)
  }
  
  fileprivate func successAlert(_ message: String) {
    UIAlertController.show(self, contentType: .success, message: message)
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
    let userTotal = UserDefaults.standard.double(forKey: "total")
    goal = (drunken / (userTotal * 1000)) * 100
    
    if goal >= 100 {
      congratsLabel.textColor = .systemYellow
      goalLabel.textColor = .yellow
      goalLabel.text = "목표의 \(goal)%"
      successAlert("오늘 권장량을 초과했어요!\n\(input)ml 마시기 성공!")
    } else {
      goalLabel.text = "목표의 \(goal)%"
      changeImage(goal)
      drankAlert("\(input)ml 마시기 성공!")
    }
  }
  
  func changeImage(_ goal: Double) {
    let grade = floor(goal / 10)
    
    UserDefaults.standard.set(grade, forKey: "imageGrade")
    switch grade {
    case 1:
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
    drunken = 0
    sacImageView.image = UIImage(named: "1-1")
    congratsLabel.textColor = .clear
    UserDefaults.standard.set(1, forKey: "imageGrade")
  }
  
  @IBAction func onProfileButton(_ sender: UIBarButtonItem) {
    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileVC") as? ProfileViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: Extensions
extension DrinkWaterViewController {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  private func setImageAnimation() {
    UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse, .beginFromCurrentState]) {
      self.sacImageView.transform = CGAffineTransform(translationX: 0, y: 0).scaledBy(x: 0.9, y: 0.9)
    }
  }
  
  private func setImageOriginal() {
    self.sacImageView.layer.removeAllAnimations()
    self.sacImageView.transform = .identity
  }
}
