//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 6/13/19.
//  Copyright © 2019 Thoai Le. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?

    @IBAction func DarkModeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func blueButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    
}
