//
//  ClockView.swift
//  Clock
//
//  Created by  Bagrat Arutyunov on 12.11.2020.
//

import UIKit

@IBDesignable
class ClockView: UIView {

    var isSetuped = false
    
    //делаем маркеры часов 12-3-6-9
    
    private let topMarker = UIView()
    private let bottomMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    
    
    //marker size
    
    var markerWidth: CGFloat = 4{
        didSet{
            layoutIfNeeded()
        }
    }
    
    
    var markerLength: CGFloat = 20{
        didSet{
            layoutIfNeeded()
        }
    }
    
    // marker color
     
    @IBInspectable
    var markerColor: UIColor = UIColor.black{
        didSet{
            for v in [topMarker, bottomMarker, leftMarker, rightMarker]{
                v.backgroundColor = markerColor
            }
        }
    }
    
    
    
    
    
    
    
    // hourLine
    
    private let hourLine = UIView()
    
    
    // hour line sizes
    
    var hourLineWidth: CGFloat = 6{
        didSet{
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var hourLineOffset: CGFloat = 60{
        didSet{
            setNeedsLayout()
        }
    }
    
    
    // hour line color
    
    @IBInspectable
    var hourLineColor: UIColor = UIColor.black{
        didSet{
            hourLine.backgroundColor = hourLineColor
        }
    }
    
    // hours
    
    @IBInspectable
    var hours: CGFloat = 1{
        didSet{
            setNeedsLayout()
        }
    }
    
    
    
    // минутная стрекла
    
    
    private let minuteLine = UIView()
    
    
    var minuteLineWidth: CGFloat = 4{
        didSet{
            layoutIfNeeded()
        }
    }
    
    
    @IBInspectable
    var minuteLineOffset: CGFloat = 30{
        didSet{
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    var minuteLineColor: UIColor = UIColor.black{
        didSet{
            minuteLine.backgroundColor = minuteLineColor
        }
    }
    
    
    @IBInspectable
    var minutes: CGFloat = 30{
        didSet{
            setNeedsLayout()
        }
    }
    
    
    
    
    
    
    
    //секундная стрелка
    
    private let secondLine = UIView()
    
    var secondLineWidth: CGFloat = 2{
        didSet{
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var secondLineOffset: CGFloat = 20{
        didSet{
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    var secondLineColor: UIColor = UIColor.black{
        didSet{
            secondLine.backgroundColor = secondLineColor
        }
    }
    
    
    @IBInspectable
    var seconds : CGFloat = 30{
        didSet{
            setNeedsLayout()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // делаем кружок внутри часов
    
    private let roundView = UIView()
    
    @IBInspectable
    var roundViewColor: UIColor = UIColor.black{
        didSet{
            roundView.backgroundColor = roundViewColor
        }
    }
    
    
    
    
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        let w = frame.size.width
        let h = frame.size.height
        
        
        // marker frame
        
        
        topMarker.frame = CGRect(x: w/2 - markerWidth/2, y: 0, width: markerWidth, height: markerLength)
        bottomMarker.frame = CGRect(x: w/2 - markerWidth/2, y: h - markerLength, width: markerWidth, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h/2 - markerWidth/2, width: markerLength, height: markerWidth)
        rightMarker.frame = CGRect(x: w - markerLength, y: h/2 - markerWidth/2, width: markerLength, height: markerWidth)
        
        
        
        // set the color of markers
        
        for v in [topMarker, bottomMarker, leftMarker, rightMarker]{
            v.backgroundColor = markerColor
        }
        
        
        
        
        
        // hour line
        
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        
        
        hourLine.frame = CGRect(x: w/2 - hourLineWidth/2, y: hourLineOffset, width: hourLineWidth, height: h/2 - hourLineOffset)
        hourLine.backgroundColor = hourLineColor
        
        updateHours()
        
        
        //minute line
        
        
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.frame = CGRect(x: w/2 - minuteLineWidth/2, y: minuteLineOffset, width: minuteLineWidth, height: h/2 - minuteLineOffset)
        minuteLine.backgroundColor = minuteLineColor
        
        updateMinets()
        
        
        //second line
        
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.frame = CGRect(x: w/2 - secondLineWidth/2, y: secondLineOffset, width: secondLineWidth, height: h/2 - secondLineOffset)
        secondLine.backgroundColor = secondLineColor
        
        updateSeconds()
        
        
        
        
        //round view
        
        roundView.frame = CGRect(x: w/2 - 8, y: h/2 - 8, width: 16, height: 16)
        roundView.backgroundColor = roundViewColor
        roundView.layer.cornerRadius = 8
        
        // делаем часы закругленными и с белой окантовкой
        
        layer.cornerRadius = frame.size.width/2
        layer.borderWidth = 4
        layer.borderColor = UIColor.black.cgColor
        
        
        
        

        if isSetuped {return}
        isSetuped = true
        
        
        for i in [topMarker, bottomMarker, leftMarker, rightMarker, hourLine, roundView, minuteLine, secondLine]{
            addSubview(i)
        }
   

    }
    
    
    
    //методы изменения
    
    
    func updateHours(){
        let angle1 = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle1)
        
    }
    
    
    
    func updateMinets(){
        let angle2  = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle2)
    }
    
    func updateSeconds(){
        let angle3 = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle3)
    }
    
    
    
    
    
    
    

}
