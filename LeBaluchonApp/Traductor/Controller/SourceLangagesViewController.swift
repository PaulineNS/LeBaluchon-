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
        selector[index].isHidden = false
    }
    
    func selectedButton(index: Int) {
        self.index = index
        unselectedButton()
        selector[index].isHidden = false
        selectedSourceLangage = langages[index].currentTitle
    }
    
    private func unselectedButton() {
        selector.forEach({ $0.isHidden = true })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton {
            let translationVC = segue.destination as! TranslationController
            translationVC.sourceLangageButton.setTitle(button.currentTitle, for: .normal)
        }
    }
}


extension SourceLangagesViewController: LangageSelectedDelegate{
    func onSelectedLangage(buttonType: LangagesButtonType) {
        switch buttonType {
        case .buttonAllemand:
            selectedButton(index: 0)
        case .buttonAnglais:
            selectedButton(index: 1)
        case .buttonEspagnol:
            selectedButton(index: 2)
        case .buttonFrancais:
            selectedButton(index: 3)
        case .buttonItalien:
            selectedButton(index: 4)
        }
    }
}
