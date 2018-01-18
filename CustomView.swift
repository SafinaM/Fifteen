//
//  CustomView.swift
//  Fifteen
//
//  Created by LinuxPlus on 1/17/18.
//  Copyright © 2018 Stanford Uneversity. All rights reserved.
//

import UIKit

class CustomView: UIView {

	
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		drawRingFittingInsideView()
		let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
		drawRect(rect: rect, color: UIColor.green)
		
    }
	internal func drawRingFittingInsideView()->()
	{
		let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
		let desiredLineWidth:CGFloat = 1    // your desired value
		
		let circlePath = UIBezierPath(
			arcCenter: CGPoint(x:halfSize, y:halfSize),
			radius: CGFloat( halfSize - (desiredLineWidth/2) ),
			startAngle: CGFloat(0),
			endAngle:CGFloat(Double.pi * 2),
			clockwise: true)

		let shapeLayer = CAShapeLayer()
		shapeLayer.path = circlePath.cgPath
		
		
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.strokeColor = UIColor.red.cgColor
		shapeLayer.lineWidth = desiredLineWidth
		
		layer.addSublayer(shapeLayer)
	}
	
	func drawRect(rect: CGRect, color: UIColor) {
		let path: UIBezierPath = UIBezierPath(rect: rect)
		color.set()
		path.stroke()
		print("it ran")
		NSLog("drawRect has updated the view")
	}


}
