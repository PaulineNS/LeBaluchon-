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
    var languagesButtons: LanguagesButtonsEnum = .source
    let languagesDictionnary = ["Allemand": "de", "Anglais": "en","Espagnol": "es","Français": "fr", "Italien": "it"]
    
    //MARK: OUTLETS
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var sourceText: UITextView!
    @IBOutlet weak var targetText: UITextView!
    @IBOutlet weak var sourceLanguageButton: UIButton!
    @IBOutlet weak var targetLanguageButton: UIButton!

    override func viewDidLoad() {
        errorLabel.isHidden = true
        sourceText.delegate = self
        targetText.isEditable = false
        
        if sourceText.text != "Saisissez du texte" {
            translate()
        }
    }
}

extension TranslationController {
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
    @IBAction func didTapExchangeLanguagesButton(_ sender: Any) {
        let sourceTitle = sourceLanguageButton.currentTitle
        sourceLanguageButton.setTitle(targetLanguageButton.currentTitle, for: .normal)
        targetLanguageButton.setTitle(sourceTitle, for: .normal)
        
        if sourceText.text != "Saisissez du texte"{
            translate()
        }
    }
    
    //To choose another language
    @IBAction func didTapLanguageButton(_ sender: UIButton) {
        languagesButtons = sender.tag == 1 ? .source : .target
        performSegue(withIdentifier: "fromTraductorToLangagesController", sender: sender)
    }
}

extension TranslationController{
    
    //Action to do after the unwindSegue from LanguagesViewController
    @IBAction func didUnwindFromLanguagesViewController(_ sender: UIStoryboardSegue){
    guard let languagesViewController = sender.source as? LanguagesViewController else { return }
        guard let selectedLanguage = languagesViewController.selectedLanguage else { return }
        switch languagesButtons {
        case .source:
            sourceLanguageButton.setTitle(selectedLanguage, for: .normal)
        case .target:
            targetLanguageButton.setTitle(selectedLanguage, for: .normal)
        }
    }
    
    // Segue to LangagesViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromTraductorToLangagesController" {
            if let button = sender as? UIButton {
                let vcDestination = segue.destination as? LanguagesViewController
                if button.tag == 1 {
                    vcDestination?.selectedLanguage = button.currentTitle
                    vcDestination?.labelTitle = "Langue Source"
                } else if button.tag == 2 {
                    vcDestination?.selectedLanguage = button.currentTitle
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
        guard let sourceIndex = languagesDictionnary.index(forKey: sourceLanguageButton.currentTitle ?? ""),
            let targetIndex = languagesDictionnary.index(forKey: targetLanguageButton.currentTitle ?? "") else {
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



