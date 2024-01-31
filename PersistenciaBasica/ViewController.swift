//
//  ViewController.swift
//  PersistenciaBasica
//
//  Created by Dianelys Saldaña on 1/31/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    
    var fechaEdicion: Date!
    
    let prefs = UserDefaults();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let storedText = prefs.string(forKey: "texto"),
           let storedDate = prefs.object(forKey: "fecha") as? Date {
            
            textView.text = storedText
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .medium
            label.text = dateFormatter.string(from: storedDate)
        }
    }

    @IBAction func guardar(_ sender: UIButton) {
        self.fechaEdicion = Date()
        
        self.textView.text = DateFormatter.localizedString(from:self.fechaEdicion!, dateStyle: .short, timeStyle: .medium)
        
        self.label.text = DateFormatter.localizedString(from:self.fechaEdicion!, dateStyle: .short, timeStyle: .medium)

        let texto = textView.text
        prefs.set(texto, forKey: "texto")
        prefs.set(fechaEdicion, forKey: "fecha")
        
        prefs.synchronize()
    }
    
}

