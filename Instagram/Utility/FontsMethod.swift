//
//  Fonts.swift
//  Instagram
//
//  Created by sheikh on 10/20/22.
//

import Foundation
import UIKit

class Fonts {
    
    func displayFontNames() {
        for family: String in UIFont.familyNames{
            print(family)
            
            for names: String in UIFont.fontNames(forFamilyName: family){
                print("HELLO: \(names)")
            }
        }
    }
}
