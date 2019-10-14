//
//  TranslatorController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 24/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TranslationController: UIViewController, UITextViewDelegate {
    
    let languagesDictionnary = ["Allemand": "ge", "Anglais": "en","Espagnol": "es","Français": "fr", "Italien": "it"]
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var sourceText: UITextView!
    @IBOutlet weak var targetText: UITextView!
    @IBOutlet weak var sourceLangageButton: UIButton!
    @IBOutlet weak var targetLangageButton: UIButton!
    @IBAction func unwindToTranslator(_ sender: UIStoryboardSegue){}
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        sourceText.resignFirstResponder()
    }
    
    @IBAction func didTapClearButton(_ sender: Any) {
        errorLabel.isHidden = true
        sourceText.text = "Saisissez du texte"
        sourceText.textColor = UIColor.lightGray
        targetText.text = ""
    }
    
    @IBAction func didTapExchangeLangagesButton(_ sender: Any) {
        let sourceTitle = sourceLangageButton.currentTitle
        sourceLangageButton.setTitle(targetLangageButton.currentTitle, for: .normal)
        targetLangageButton.setTitle(sourceTitle, for: .normal)
        
        if sourceText.text != "Saisissez du texte"{
            translate()
        }
    }
    
    @IBAction func didTapSourceLangageButton(_ sender: UIButton) {
        performSegue(withIdentifier: "fromTraductorToLangagesController", sender: sender)
    }
    
    @IBAction func didTapTargetLangageButton(_ sender: UIButton) {
        performSegue(withIdentifier: "fromTraductorToLangagesController", sender: sender)
    }
    
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
    
    override func viewDidLoad() {
        errorLabel.isHidden = true
        sourceText.delegate = self
        targetText.isEditable = false
        
        if sourceText.text != "Saisissez du texte"{
            translate()
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        translate()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if sourceText.text == "Saisissez du texte"{
            sourceText.text = ""
        }
    }
    
    func translate() {
        guard let sourceIndex = languagesDictionnary.index(forKey: sourceLangageButton.currentTitle ?? ""),
            let targetIndex = languagesDictionnary.index(forKey: targetLangageButton.currentTitle ?? "") else {
                return
        }
        
        TranslationService.shared.getTranslation(text: sourceText.text ?? "", source: languagesDictionnary[sourceIndex].value, target: languagesDictionnary[targetIndex].value) { result in
            switch result {
            case let .success(translateString):
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
