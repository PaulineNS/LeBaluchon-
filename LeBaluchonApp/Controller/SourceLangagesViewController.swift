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
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        unselectedButton()
        selector[index].isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func selectedButton(index: Int) {
        self.index = index
        unselectedButton()
        selector[index].isHidden = false
        selectedSourceLangage = langages[index].currentTitle
        performSegue(withIdentifier: "segueFromSourceToTranslator", sender: self)
    }
    
    @IBAction func didTapAllemandButton(_ sender: Any) {
        selectedButton(index: 0)
    }
    
    @IBAction func didTapAnglaisButton(_ sender: Any) {
        selectedButton(index: 1)
    }
    
    @IBAction func didTapEspagnolButton(_ sender: Any) {
        selectedButton(index: 2)
    }
    
    @IBAction func didTapFrançaisButton(_ sender: Any) {
        selectedButton(index: 3)
    }
    
    @IBAction func didTapItalienButton(_ sender: Any) {
        selectedButton(index: 4)
    }
    
    private func unselectedButton() {
        selector.forEach({ $0.isHidden = true })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromSourceToTranslator" {
            let translationVC = segue.destination as! TranslationController
            translationVC.selectedSourceLangage = selectedSourceLangage
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
