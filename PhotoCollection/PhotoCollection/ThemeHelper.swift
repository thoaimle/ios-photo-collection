//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 6/13/19.
//  Copyright © 2019 Thoai Le. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = ""
    
    var themePreference : String? {
        let userDefault  = UserDefaults.standard
        let themePreference = userDefault.string(forKey: themePreferenceKey)
        return themePreference
    }
    func setThemePreferenceToDark() {
        let userDefault = UserDefaults.standard
        userDefault.set("Dark",forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        let userDefault = UserDefaults.standard
        userDefault.set("Blue", forKey: themePreferenceKey)
    }
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
