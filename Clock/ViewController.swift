//
//  ViewController.swift
//  Clock
//
//  Created by  Bagrat Arutyunov on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myButtonView: CustomButton!
    
    
            override func viewDidLoad() {
                super.viewDidLoad()
                
                myButtonView.delegate = self
                
        
            
        
        }

    
    
    
    @IBAction func CustomSegmentAction(_ sender: CustomSegmentControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print(sender.selectedSegmentIndex + 1)
        case 1:
            print(sender.selectedSegmentIndex + 1)
        default:
            break
        }
        
    }
    
    
    
    
    
    
}


extension ViewController: ButtonViewDelegate {
    func buttonPressed(_ custoButton: CustomButton) {
        print("pressed")
    }
    
    
}
