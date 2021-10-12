//
//  LetsDrinkWater++UIAlert.swift
//  LetsDrinkWater
//
//  Created by KEEN on 2021/10/11.
//

import UIKit

extension UIAlertController {
  enum ContentType: String {
    case error = "⚠️ 오류 🤯"
    case drank = "꿀꺽 💦"
    case success = "🎖 축목표 달성! 🎖"
  }
  
  static func show(_ presentedHost: UIViewController,
                   contentType: ContentType,
                   message: String) {
    let alert = UIAlertController(
      title: contentType.rawValue,
      message: message,
      preferredStyle: .alert)
    let okAction = UIAlertAction(
      title: "확인", style: .default, handler: nil)
    alert.addAction(okAction)
    presentedHost.present(alert, animated: true, completion: nil)
  }
}
