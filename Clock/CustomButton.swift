//
//  CustomButton.swift
//  Clock
//
//  Created by  Bagrat Arutyunov on 21.11.2020.
//

import UIKit


protocol ButtonViewDelegate: NSObjectProtocol {
    func buttonPressed( _ custoButton: CustomButton)
}




@IBDesignable
class CustomButton: UIView {
    
    weak var delegate : ButtonViewDelegate?
    
    
    
 
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable
    var cornerRad: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRad
        }
    }
    
    @IBInspectable
    var text: String = "" {
        didSet {
            updateView()
        }
    }
    
    
    
    @IBInspectable
    var textColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable
    var btnImageName: String = ""{
        didSet {
            updateView()
        }
    }
    

    
    
    
    
    
    
    
    
    
    
    func updateView() {
        subviews.forEach { $0.removeFromSuperview() }
        
        let buttonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        buttonImage.image = UIImage(named: btnImageName)
        
        var buttonLabel = UILabel()
        
        if btnImageName != ""{
             buttonLabel = UILabel(frame: CGRect(x: buttonImage.frame.size.width , y: 0 , width: self.frame.size.width - self.frame.size.height , height: self.frame.size.height))
        }else{
            buttonLabel = UILabel(frame: CGRect(x: 0 , y: 0 , width: self.frame.size.width  , height: self.frame.size.height))
            
        }
        
        buttonLabel.text = text
        buttonLabel.textColor = textColor
        buttonLabel.textAlignment = .center
       
        
        buttonLabel.backgroundColor = self.backgroundColor
        buttonImage.backgroundColor = self.backgroundColor
        
        buttonLabel.layer.cornerRadius = self.layer.cornerRadius
        buttonImage.layer.cornerRadius = self.layer.cornerRadius
        
        
        
        buttonImage.contentMode = .scaleAspectFit
        
        
        
        addSubview(buttonImage)
        addSubview(buttonLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        
        self.addGestureRecognizer(tap)
        
    }
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
    
    
    
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        delegate?.buttonPressed(self)
        //buttonTapped(tap)
    }
    
    
}
