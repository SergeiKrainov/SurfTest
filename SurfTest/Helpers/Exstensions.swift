//
//  Exstensions.swift
//  SurfTest
//
//  Created by Sergey on 08.02.2023.
//

import Foundation
import UIKit

extension ViewController {
    func showAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
      }
}
