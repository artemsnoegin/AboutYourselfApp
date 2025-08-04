//
//  Card.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 04.08.2025.
//

class Card {
    var name: String?
    var age: Int?
    var location: String?
    var hobby: String?
    
    func containsNil() -> Bool {
        if name == nil || age == nil || location == nil || hobby == nil {
            return true
        } else {
            return false
        }
    }
}
