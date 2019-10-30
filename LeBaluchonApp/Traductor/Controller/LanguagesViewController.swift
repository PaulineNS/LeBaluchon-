//
//  SourceLangagesViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class LanguagesViewController: UIViewController {
    
    //MARK: VARIABLES
    var labelTitle: String? = ""
    var index = 0
    var selectedLanguage: String?
    
    //MARK: OUTLETS
    @IBOutlet private var selector: [UILabel]!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        titleLabel.text = labelTitle
        unselectedButton()
        selectTheLanguage()
    }
}

extension LanguagesViewController {
    //MARK: ACTION
    @IBAction func didTapOnLanguageButton(_ sender: UIButton) {
        selectedLanguage = sender.title(for: .normal)
    }
}

extension LanguagesViewController {
    // Unselect all the languages button
    private func unselectedButton() {
        selector.forEach({ $0.isHidden = true })
    }
    
    // Select just the button user selected
    private func selectedButton(index: Int) {
        self.index = index
        unselectedButton()
        selector[index].isHidden = false
    }
    
    private func selectTheLanguage() {
        switch selectedLanguage {
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


