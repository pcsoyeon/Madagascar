//
//  CardView.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/01.
//

import UIKit

class CardView: UIView {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    // MARK: - Custom View
    
    override func draw(_ rect: CGRect) {
        // Card view corner radius
        let cardRadius = CGFloat(30)
        // Button slot arc radius
        let buttonSlotRadius = CGFloat(30)
        
        // Card view frame dimensions
        let viewSize = self.bounds.size
        // Effective height of the view
        let effectiveViewHeight = viewSize.height - buttonSlotRadius
        // Get a path to define and traverse
        let path = UIBezierPath()
        // Shift origin to left corner of top straight line
        path.move(to: CGPoint(x: cardRadius, y: 0))
        
        // top line
        path.addLine(to: CGPoint(x: viewSize.width - cardRadius, y: 0))
        // top-right corner arc
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width - cardRadius,
                y: cardRadius
            ),
            radius: cardRadius,
            startAngle: CGFloat(Double.pi * 3 / 2),
            endAngle: CGFloat(0),
            clockwise: true
        )
        // right line
        path.addLine(
            to: CGPoint(x: viewSize.width, y: effectiveViewHeight)
        )
        
        // bottom-right corner arc
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width - cardRadius,
                y: effectiveViewHeight - cardRadius
            ),
            radius: cardRadius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi / 2),
            clockwise: true
        )
        // right half of bottom line
        path.addLine(
            to: CGPoint(x: viewSize.width / 4 * 3, y: effectiveViewHeight)
        )
        // button-slot right arc
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width / 4 * 3 - buttonSlotRadius,
                y: effectiveViewHeight
            ),
            radius: buttonSlotRadius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi / 2),
            clockwise: true
        )
        
        // button-slot line
        path.addLine(
            to: CGPoint(
                x: viewSize.width / 4 + buttonSlotRadius,
                y: effectiveViewHeight + buttonSlotRadius
            )
        )
        // button left arc
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width / 4 + buttonSlotRadius,
                y: effectiveViewHeight
            ),
            radius: buttonSlotRadius,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(Double.pi),
            clockwise: true
        )
        // left half of bottom line
        path.addLine(
            to: CGPoint(x: cardRadius, y: effectiveViewHeight)
        )
        // bottom-left corner arc
        path.addArc(
            withCenter: CGPoint(
                x: cardRadius,
                y: effectiveViewHeight - cardRadius
            ),
            radius: cardRadius,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(Double.pi),
            clockwise: true
        )
        // left line
        path.addLine(to: CGPoint(x: 0, y: cardRadius))
        // top-left corner arc
        path.addArc(
            withCenter: CGPoint(x: cardRadius, y: cardRadius),
            radius: cardRadius,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi / 2 * 3),
            clockwise: true
        )
        
        // close path join to origin
        path.close()
        // Set the background color of the view
        UIColor.gray.set()
        path.fill()
    }
    
}
