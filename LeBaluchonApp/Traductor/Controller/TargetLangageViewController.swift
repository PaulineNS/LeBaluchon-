//
//  TargetLangageViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 27/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TargetLangageViewController: UIViewController {
    
    var index = 0
    var selectedTargetLangage: String!
    @IBOutlet var selector: [UILabel]!
    @IBOutlet var langages: [UIButton]!
    
    
    override func viewWillAppear(_ animated: Bool) {
        unselectedButton()
        selector[index].isHidden = false
    }
    
    func selectedButton(index: Int) {
        self.index = index
        unselectedButton()
        selector[index].isHidden = false
        selectedTargetLangage = langages[index].currentTitle
    }
    
    private func unselectedButton() {
        selector.forEach({ $0.isHidden = true })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton {
            let translationVC = segue.destination as! TranslationController
            translationVC.targetLangageButton.setTitle(button.currentTitle, for: .normal)
        }
    }
}

