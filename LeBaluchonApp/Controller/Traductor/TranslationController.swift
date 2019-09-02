//
//  TranslatorController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 24/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TranslationController: UIViewController {
    
    //var sourceLangageDelegate: LangageSelectedDelegate?
    //var selectedTargetLangage: String!

    let languagesDictionnary = ["Allemand": "ge", "Anglais": "en", "Espagnol": "es", "Français": "fr", "Italien": "it"]

    @IBOutlet weak var sourceLangageButton: UIButton!
    @IBOutlet weak var targetLangageButton: UIButton!
    @IBOutlet weak var textToTranslateTextField: UITextField!
    @IBOutlet weak var translatedTextLabel: UILabel!
    
    @IBAction func unwindToTranslator(_ sender: UIStoryboardSegue){}
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textToTranslateTextField.resignFirstResponder()
    }
    
    
    @IBAction func didEnterText(_ sender: Any) {
        translate()
    }
    
    func translate() {
        TranslationService.shared.getTranslation(text: textToTranslateTextField.text ?? "", source: languagesDictionnary[sourceLangageButton.currentTitle ?? ""] ?? "", target: languagesDictionnary[targetLangageButton.currentTitle ?? ""] ?? "") { (translation) in
            if let translation = translation {
                self.update(data: translation)
            } else {
                self.presentAlert(message: "La traduction n'a pas aboutit")
            }
        }
    }
    
    func update(data: Data) {
        translatedTextLabel.text = data.data.translations[0].translatedText
        print (data.data.translations[0].translatedText)
    }
    
   /* @IBAction func didTapSourceLangageButton(_ sender: Any) {
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
    } */
    
}
