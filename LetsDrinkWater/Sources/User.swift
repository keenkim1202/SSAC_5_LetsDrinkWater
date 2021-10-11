//
//  User.swift
//  LetsDrinkWater
//
//  Created by KEEN on 2021/10/11.
//

import Foundation

class User {
  var nickname: String
  var height: Double
  var weight: Double
  
  init(nickname: String, height: Double, weight: Double) {
    self.nickname = nickname
    self.height = height
    self.weight = weight
  }
}
