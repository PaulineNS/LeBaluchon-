//
//  ControllerExtension.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 27/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

//MARK: ALERT
extension UIViewController {
    
    func presentAlert(message: String){
        let alertVC = UIAlertController(title: "Erreur!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    func convertDateFromUnix(unixTime: Int, abbreviation: String) -> String {
        let weatherDate = NSDate(timeIntervalSince1970: TimeInterval(unixTime))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: abbreviation)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.string(from: weatherDate as Date)
    }
    
}
