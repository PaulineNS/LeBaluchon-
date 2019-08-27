//
//  ControllerExtension.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 27/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(message: String){
        let alertVC = UIAlertController(title: "Erreur!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
    }
    
}
