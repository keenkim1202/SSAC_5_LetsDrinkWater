//
//  ProfileViewController.swift
//  LetsDrinkWater
//
//  Created by KEEN on 2021/10/11.
//

import UIKit

class ProfileViewController: UIViewController {
  
  // MARK: Enum - tableView Cells
  enum Item: String {
    case image = "imageCell"
    case nickname = "nicknameCell"
    case height = "heightCell"
    case weight = "weightCell"
    
    func dequeueCell(_ tableView: UITableView) -> UITableViewCell? {
      let cell = tableView.dequeueReusableCell(withIdentifier: self.rawValue)
      return cell
    }
  }
  
  // MARK: Properties
  fileprivate var items: [Item] = [.image, .nickname, .height, .weight]
  fileprivate var itemInputs: [Item: String] = [:]
  
  // MARK: UI
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // MARK: Action
  @IBAction func onDoneButton(_ sender: UIBarButtonItem) {
    self.tableView.endEditing(true)
    
    guard let nickname = itemInputs[.nickname] else { return }
    if nickname.isEmpty { showAlert("닉네임을 입력해주세요") }

    guard let height = itemInputs[.height] else { return }
    if height.isEmpty { showAlert("키(cm)를 입력해주세요") }
    
    guard let weight = itemInputs[.weight] else { return }
    if weight.isEmpty { showAlert("몸무게(kg)을 입력헤주세요") }
    
    let h = Double(height) ?? 0
    let w = Double(weight) ?? 0
    let total = (h + w) / 100
    
    UserDefaults.standard.set(nickname, forKey: "nickname")
    UserDefaults.standard.set(height, forKey: "height")
    UserDefaults.standard.set(weight, forKey: "weight")
    UserDefaults.standard.set(total, forKey: "total")
    
    self.navigationController?.popViewController(animated: true)
  }
  
  // MARK: Alert
  fileprivate func showAlert(_ message: String) {
    UIAlertController.show(self, contentType: .error, message: message)
  }
  
  // MARK: Action
  @IBAction func onBackButton(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
}

// MARK: Extensions
extension ProfileViewController {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}

// MARK: UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    let item = items[textField.tag]
    if view.endEditing(true) {
      itemInputs[item] = textField.text
    }
    itemInputs[item] = textField.text
  }
}

// MARK: UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    let cell = item.dequeueCell(tableView) as! ProfileTableViewCell
  
    if let textField = cell.answerTextField {
      textField.delegate = self
      textField.tag = indexPath.row
    }
    
    switch item {
    case .image:
      let grade = UserDefaults.standard.integer(forKey: "imageGrade")
      cell.sacImageView.image = UIImage(named: "1-\(grade)")
    case .nickname:
      cell.answerTextField.text = UserDefaults.standard.string(forKey: "nickname")
      itemInputs[item] = cell.answerTextField.text
    case .height:
      cell.answerTextField.text = UserDefaults.standard.string(forKey: "height")
      itemInputs[item] = cell.answerTextField.text
    case .weight:
      cell.answerTextField.text = UserDefaults.standard.string(forKey: "weight")
      itemInputs[item] = cell.answerTextField.text
    }
    cell.selectionStyle = .none
    return cell
  }
  
}

// MARK: UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch items[indexPath.row] {
    case .image: return CGFloat(150)
    default:     return CGFloat(65)
    }
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
      switch items[indexPath.row] {
      case .image:  return CGFloat(150)
      default:      return CGFloat(65)
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.endEditing(true)
    }
}
