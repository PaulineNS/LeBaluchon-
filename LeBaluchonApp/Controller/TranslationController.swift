//
//  TranslatorController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 24/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TranslationController: UIViewController {
    
    var sourceLangageDelegate: LangageSelectedDelegate?
    var selectedSourceLangage: String!
    
    @IBOutlet weak var sourceLangageButton: UIButton!
    @IBOutlet weak var targetLangageButton: UIButton!
    @IBOutlet weak var textToTranslateTextField: UITextField!
    @IBOutlet weak var translatedTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitle()
    }
    
    @IBAction func didTapSourceLangageButton(_ sender: Any) {
        if sourceLangageButton.currentTitle == "Anglais" {
            sourceLangageDelegate?.onSelectedLangage(buttonType: .buttonAnglais)
        } else if sourceLangageButton.currentTitle == "Allemand" {
            sourceLangageDelegate?.onSelectedLangage(buttonType: .buttonAllemand)
        } else if sourceLangageButton.currentTitle == "Espagnol" {
            sourceLangageDelegate?.onSelectedLangage(buttonType: .buttonEspagnol)
        } else if sourceLangageButton.currentTitle == "Italien" {
            sourceLangageDelegate?.onSelectedLangage(buttonType: .buttonItalien)
        } else if sourceLangageButton.currentTitle == "Français" {
            sourceLangageDelegate?.onSelectedLangage(buttonType: .buttonFrancais)
        }
    }
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textToTranslateTextField.resignFirstResponder()
    }
    
    func setButtonTitle(){
        if let title = selectedSourceLangage {
            sourceLangageButton.setTitle(title, for: .normal)
        }
    }
    
    func translate() {
        TranslationService().getTranslation { (translation) in
            if let translation = translation {
                self.update(translation: translation)
            }
        } // Error
    }
    
    func update(translation: Translation) {
        textToTranslateTextField.text = translation.q
        translatedTextLabel.text = translation.translatedText
    }
}
