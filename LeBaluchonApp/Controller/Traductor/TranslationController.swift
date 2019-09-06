//
//  TranslatorController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 24/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TranslationController: UIViewController {
    
    let languagesDictionnary = ["Allemand": "ge", "Anglais": "en","Espagnol": "es","Français": "fr", "Italien": "it"]
    
    @IBOutlet weak var sourceLangageButton: UIButton!
    @IBOutlet weak var targetLangageButton: UIButton!
    @IBOutlet weak var textToTranslateTextField: UITextField!
    @IBOutlet weak var translatedTextLabel: UILabel!
    
    @IBAction func unwindToTranslator(_ sender: UIStoryboardSegue){}
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textToTranslateTextField.resignFirstResponder()
    }
    
    @IBAction func didTapExchangeLangagesButton(_ sender: Any) {
        let sourceTitle = sourceLangageButton.currentTitle
        sourceLangageButton.setTitle(targetLangageButton.currentTitle, for: .normal)
        targetLangageButton.setTitle(sourceTitle, for: .normal)
    }
    
    @IBAction func didEnterText(_ sender: Any) {
        translate()
    }
    
    // Select the actual SourceLanguage in SourceLanguageViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSourceLanguage" {
            if let sourceLangageController = segue.destination as? SourceLangagesViewController {
                sourceLangageController.selectedSourceLangage = sourceLangageButton.currentTitle
            }
        } else if segue.identifier == "segueToTargetLanguage" {
            if let targetLangageController = segue.destination as? TargetLangageViewController {
                targetLangageController.selectedTargetLangage = targetLangageButton.currentTitle
            }
        }
    }
    
    func translate() {
        guard let sourceIndex = languagesDictionnary.index(forKey: sourceLangageButton.currentTitle ?? ""),
            let targetIndex = languagesDictionnary.index(forKey: targetLangageButton.currentTitle ?? "") else {
                return
        }
        
        TranslationService.shared.getTranslation(text: textToTranslateTextField.text ?? "", source: languagesDictionnary[sourceIndex].value, target: languagesDictionnary[targetIndex].value) { result in
            switch result {
            case let .success(translateString):
                self.update(data: translateString)
            case .failure:
                self.presentAlert(message: "La traduction n'a pas aboutit")
            }
        }
    }
    
    func update(data: Data) {
        translatedTextLabel.text = data.data.translations[0].translatedText
    }
}
