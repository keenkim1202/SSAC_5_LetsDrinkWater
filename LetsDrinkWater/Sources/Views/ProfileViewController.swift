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
  
  // MARK: UI
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
}

// MARK: UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
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
    return cell
  }
  
}

// MARK: UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch items[indexPath.row] {
    case .image: return CGFloat(150)
    default: return CGFloat(65)
    }
  }
  
  func tableView(
    _ tableView: UITableView,
    estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
      switch items[indexPath.row] {
      case .image:  return CGFloat(150)
      default:      return CGFloat(65)
    }
  }
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath) {
      tableView.endEditing(true)
    }
}
