//
//  SourceLangagesViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class LangagesViewController: UIViewController {
    
    //MARK: VARIABLES
    var labelTitle: String? = ""
    var index = 0
    var selectedLangage: String?
    
    //MARK: OUTLETS
    @IBOutlet private var selector: [UILabel]!
    @IBOutlet private var langages: [UIButton]!
    @IBOutlet private weak var titleLabel: UILabel!
}

extension LangagesViewController {
    
    override func viewDidLoad() {
        titleLabel.text = labelTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        unselectedButton()
        selectTheLangage()
    }
}

extension LangagesViewController {
    
    // Unselect all the langages button
    private func unselectedButton() {
        selector.forEach({ $0.isHidden = true })
    }
    
    // Select just the button user selected
    private func selectedButton(index: Int) {
        self.index = index
        unselectedButton()
        selector[index].isHidden = false
    }
    
    private func selectTheLangage() {
        switch selectedLangage {
        case "Anglais":
            selectedButton(index: 1)
        case "Allemand":
            selectedButton(index: 0)
        case "Espagnol":
            selectedButton(index: 2)
        case "Italien":
            selectedButton(index: 4)
        case "Français":
            selectedButton(index: 3)
        default: break
        }
    }
}

extension LangagesViewController {
    
    // Changing sourceLanguage and targetLanguage in TranslationController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton {
            if let translationVC = segue.destination as? TranslationController {
                if titleLabel.text == "Langue Source" {
                    translationVC.sourceLangageButton.setTitle(button.currentTitle, for: .normal)
                } else if titleLabel.text == "Langue Cible" {
                    translationVC.targetLangageButton.setTitle(button.currentTitle, for: .normal)
                }
            }
        }
    }
}


