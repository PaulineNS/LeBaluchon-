//
//  SourceLangagesViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class SourceLangagesViewController: UIViewController {
    
    var index = 0
    var selectedSourceLangage: String! 
    @IBOutlet var selector: [UILabel]!
    @IBOutlet var langages: [UIButton]!
    
    override func viewWillAppear(_ animated: Bool) {
        unselectedButton()
        selectTheLangageSource()
    }
    
    func selectedButton(index: Int) {
        self.index = index
        unselectedButton()
        selector[index].isHidden = false
    }
    
    private func unselectedButton() {
        selector.forEach({ $0.isHidden = true })
    }
    
    // Changing sourceLanguage in TranslationController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton {
            let translationVC = segue.destination as! TranslationController
            translationVC.sourceLangageButton.setTitle(button.currentTitle, for: .normal)
        }
    }
    
    func selectTheLangageSource() {
        if selectedSourceLangage == "Anglais" {
            selectedButton(index: 1)
        } else if selectedSourceLangage == "Allemand" {
            selectedButton(index: 0)
        } else if selectedSourceLangage == "Espagnol" {
            selectedButton(index: 2)
        } else if selectedSourceLangage == "Italien" {
            selectedButton(index: 4)
        } else if selectedSourceLangage == "Français" {
            selectedButton(index: 3)
        }
    }
}
