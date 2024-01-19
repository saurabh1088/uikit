//
//  RectangularView.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 27/09/23.
//

import UIKit

/**
 @IBDesignable is an attribute which when is applied to a UIView or NSView subclass, tells Interface Builder in
 Xcode to render the view directly in the canvas. This allows seeing how that custom views will appear without
 building and running the app after each change.
 
 `RectangularView` is used for example in this project in `AnimationsStoryboard`. Notice if `@IBDesignable`
 is removed from `RectangularView` then in `AnimationsStoryboard` the view using `RectangularView`
 appears white.
 However if `@IBDesignable` is added then the storyboard `AnimationsStoryboard` shows the proper
 color.
 So when storyboard is viewed with @@IBDesignable then as per default color it will show the rectangle view as
 red color.
 
 Now the color for `RectangularView` is set using property `rectangleBaseColor`. Observe the difference
 when this property is annotated with `@IBInspectable`.
 Without `@IBInspectable` the only way to observe change in color in storyboard for this view is to change
 the value of this property in code.
 However once we annotate the property `rectangleBaseColor` with `@IBInspectable` we can observe
 this property in the Interface Builder's, Attribute inspector, for the storyboard `AnimationsStoryboard`.
 */
@IBDesignable
class RectangularView: UIView {
        
    @IBInspectable var rectangleBaseColor: UIColor = UIColor.red
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        createRectangularShapeUsingBezierPath()
        /// Calling this setFill() is important here as this will set the color for rectangle view, even if with property
        /// rectangleBaseColor being @IBInspectable and can be set through Interface Builder.
        rectangleBaseColor.setFill()
        path.fill()
    }
    
    private func createRectangularShapeUsingBezierPath() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: frame.width))
        path.addLine(to: CGPoint(x: frame.width, y: frame.width))
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.close()
        self.path = path
    }
    
    // TODO: ISSUE, this is not working
    func animateRectangleView() {
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = UIBezierPath().cgPath
        animation.toValue = self.path.cgPath
        animation.duration = 2
    }
}
