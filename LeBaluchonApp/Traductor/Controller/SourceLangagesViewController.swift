//
//  SourceLangagesViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class LangagesViewController: UIViewController {
    
    var labelTitle: String? = ""
    var index = 0
    var selectedLangage: String! 
    @IBOutlet var selector: [UILabel]!
    @IBOutlet var langages: [UIButton]!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        titleLabel.text = labelTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        unselectedButton()
        selectTheLangage()
    }
    
    func selectedButton(index: Int) {
        self.index = index
        unselectedButton()
        selector[index].isHidden = false
    }
    
    private func unselectedButton() {
        selector.forEach({ $0.isHidden = true })
    }
    
    // Changing sourceLanguage and targetLanguage in TranslationController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton {
            let translationVC = segue.destination as! TranslationController
            if titleLabel.text == "Langue Source" {
                translationVC.sourceLangageButton.setTitle(button.currentTitle, for: .normal)
            } else if titleLabel.text == "Langue Cible" {
                translationVC.targetLangageButton.setTitle(button.currentTitle, for: .normal)
            }
        }
    }
    
    func selectTheLangage() {
        if selectedLangage == "Anglais" {
            selectedButton(index: 1)
        } else if selectedLangage == "Allemand" {
            selectedButton(index: 0)
        } else if selectedLangage == "Espagnol" {
            selectedButton(index: 2)
        } else if selectedLangage == "Italien" {
            selectedButton(index: 4)
        } else if selectedLangage == "Français" {
            selectedButton(index: 3)
        }
    }
}
