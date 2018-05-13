//
//  ViewController.swift
//  UserDefaults-iOSApp
//
//  Created by Max Alva on 13/05/18.
//  Copyright © 2018 Max Alva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guardar(_ sender: UIButton) {
        
        if self.textField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Escribe algo", preferredStyle: .actionSheet) // .alert
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(ok)
            present(alerta, animated: true, completion: nil)
        } else {
            UserDefaults.standard.set(self.textField.text, forKey: "valor")
            self.textField.text = ""
            self.textField.resignFirstResponder()
        }
    }

    @IBAction func mostrar(_ sender: UIButton) {
        let result = UserDefaults.standard.object(forKey: "valor")
        self.textField.text = result as? String
    }
    
    // permite ocultar el teclado al presionar en otro lado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

