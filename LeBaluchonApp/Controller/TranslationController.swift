//
//  TranslatorController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 24/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TranslationController: UIViewController {
    
    var selectedSourceLangage: String!
    
    @IBOutlet weak var sourceLangageButton: UIButton!
    @IBOutlet weak var targetLangageButton: UIButton!
    @IBOutlet weak var textToTranslateTextField: UITextField!
    @IBOutlet weak var translatedTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitle()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func didTapSourceButton(_ sender: Any) {
        performSegue(withIdentifier: "segueFromTranslatorToSource", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromTranslatorToSource" {
            let sourceLangagesVC = segue.destination as! SourceLangagesViewController
            sourceLangagesVC.selectedSourceLangage = selectedSourceLangage
        }
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
        } // Erreur
    }
    
    func update(translation: Translation) {
        textToTranslateTextField.text = translation.q
        translatedTextLabel.text = translation.translatedText
    }
}
