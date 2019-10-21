//
//  TranslatorController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 24/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class TranslationController: UIViewController {
    
    // instance
    let translationService = TranslationService()
    
    //MARK: VARIABLES
    let languagesDictionnary = ["Allemand": "de", "Anglais": "en","Espagnol": "es","Français": "fr", "Italien": "it"]
    
    //MARK: OUTLETS
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var sourceText: UITextView!
    @IBOutlet weak var targetText: UITextView!
    @IBOutlet weak var sourceLangageButton: UIButton!
    @IBOutlet weak var targetLangageButton: UIButton!
}

extension TranslationController {
    
    override func viewDidLoad() {
        errorLabel.isHidden = true
        sourceText.delegate = self
        targetText.isEditable = false
        
        if sourceText.text != "Saisissez du texte" {
            translate()
        }
    }
    
    // Actions
    //Manage the disapperance of the keyboard
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        sourceText.resignFirstResponder()
    }
    
    // clear source and target texts
    @IBAction func didTapClearButton(_ sender: Any) {
        errorLabel.isHidden = true
        sourceText.text = "Saisissez du texte"
        sourceText.textColor = UIColor.lightGray
        targetText.text = ""
    }
    
    // to reverse languages
    @IBAction func didTapExchangeLangagesButton(_ sender: Any) {
        let sourceTitle = sourceLangageButton.currentTitle
        sourceLangageButton.setTitle(targetLangageButton.currentTitle, for: .normal)
        targetLangageButton.setTitle(sourceTitle, for: .normal)
        
        if sourceText.text != "Saisissez du texte"{
            translate()
        }
    }
    
    //To change the source langage
    @IBAction func didTapSourceLangageButton(_ sender: UIButton) {
        performSegue(withIdentifier: "fromTraductorToLangagesController", sender: sender)
    }
    
    //To change the target langage
    @IBAction func didTapTargetLangageButton(_ sender: UIButton) {
        performSegue(withIdentifier: "fromTraductorToLangagesController", sender: sender)
    }
}

extension TranslationController{
    
    @IBAction func unwindToTranslator(_ sender: UIStoryboardSegue){}
    
    // Segue to LangagesViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromTraductorToLangagesController" {
            if let button = sender as? UIButton {
                let vcDestination = segue.destination as? LangagesViewController
                if button.tag == 1 {
                    vcDestination?.selectedLangage = button.currentTitle
                    vcDestination?.labelTitle = "Langue Source"
                } else if button.tag == 2 {
                    vcDestination?.selectedLangage = button.currentTitle
                    vcDestination?.labelTitle = "Langue Cible"
                }
            } else {
                print("Error")
            }
        }
    }
}

extension TranslationController: UITextViewDelegate {
    // Translate each time the textField change
    func textViewDidChange(_ textView: UITextView) {
        translate()
    }
    
    // Translate when user start editin
    func textViewDidBeginEditing(_ textView: UITextView) {
        if sourceText.text == "Saisissez du texte" {
            sourceText.text = ""
        }
    }
}

extension TranslationController {
    // Manage the translation
    func translate() {
        guard let sourceIndex = languagesDictionnary.index(forKey: sourceLangageButton.currentTitle ?? ""),
            let targetIndex = languagesDictionnary.index(forKey: targetLangageButton.currentTitle ?? "") else {
                return
        }
        
        translationService.getTranslation(text: sourceText.text ?? "", source: languagesDictionnary[sourceIndex].value, target: languagesDictionnary[targetIndex].value) { result in
            switch result {
            case .success(let translateString):
                self.errorLabel.isHidden = true
                self.update(data: translateString)
            case .failure:
                self.errorLabel.isHidden = false
            }
        }
    }
    
    func update(data: Data) {
        sourceText.textColor = UIColor.black
        targetText.text = data.data.translations[0].translatedText
    }
}



