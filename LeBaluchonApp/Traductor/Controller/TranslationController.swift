//
//  TranslatorController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 24/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TranslationController: UIViewController {
    
    var translationService = TranslationService()
    var sourceLangageDelegate: LangageSelectedDelegate?
    var selectedTargetLangage: String!
    
    @IBOutlet weak var sourceLangageButton: UIButton!
    @IBOutlet weak var targetLangageButton: UIButton!
    @IBOutlet weak var textToTranslateTextField: UITextField!
    @IBOutlet weak var translatedTextLabel: UILabel!
    
    
    @IBAction func unwindToTranslator(_ sender: UIStoryboardSegue){}
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textToTranslateTextField.resignFirstResponder()
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
    
    @IBAction func translate(_ sender: Any) {
       // translationService.getTranslation { (translation) in
           // if let translation = translation {
               // self.update(translation: translation)
         //   } else {
             //   self.presentAlert(message: "La traduction n'a pas aboutit")
       //     }
      //  }
    }

  /*  func update(translation: Translation) {
        textToTranslateTextField.text = translation.q
        selectedSourceLangage = translation.source
        translatedTextLabel.text = translation.translatedText
        
    } */
}
