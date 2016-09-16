//
//  KGNAutoLayout.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 9/14/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

import UIKit

// MARK: - Pin: Superview
extension UIView {
    
    /**
    Pin a view to all four edges of it's super view, with an offset(inset from the edges).

    - Parameter offset: How far to offset(inset) the edges of the view from the superview's edges.
    - Parameter priority: The priority of the constraints.

    - Returns: The `top`, `right`, `bottom`, and `left` constraint objects or `nil` if the constraint could not be made because the view does not have a super view.
    */
    @discardableResult
    public func pinToEdgesOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint?, right: NSLayoutConstraint?, bottom: NSLayoutConstraint?, left: NSLayoutConstraint?) {
        return (
            self.pinToTopEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToRightEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToBottomEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToLeftEdgeOfSuperview(withOffset: offset, priority: priority)
        )
    }

    /**
     Pin the top edge of the view to the top edge of it's superview.

     - Parameter offset: How far to offset the top edge of the view from the top edge of its superview.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func pinToTopEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .top, offset: offset, priority: priority)
    }

    /**
     Pin the right edge of the view to the right edge of it's superview.

     - Parameter offset: How far to offset the right edge of the view from the right edge of its superview.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func pinToRightEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .right, offset: -offset, priority: priority)
    }


    /**
     Pin the bottom edge of the view to the bottom edge of it's superview.

     - Parameter offset: How far to offset the bottom edge of the view from the bottom edge of its superview.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func pinToBottomEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .bottom, offset: -offset, priority: priority)
    }

    /**
     Pin the left edge of the view to the left edge of it's superview.

     - Parameter offset: How far to offset the left edge of the view from the bottom edge of its superview.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func pinToLeftEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .left, offset: offset, priority: priority)
    }

    /**
     Pin the left and right edges of the view to the left and right edges of it's superview.

     - Parameter offset: How far to offset the left and right edges of the view from the left and right edges of its superview.
     - Parameter priority: The priority of the constraints.

     - Returns: The `left` and `right` constraint objects or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func pinToSideEdgesOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (left: NSLayoutConstraint?, right: NSLayoutConstraint?) {
        return (
            self.pinToLeftEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToRightEdgeOfSuperview(withOffset: offset, priority: priority)
        )
    }

    /**
     Pin the top and bottom edges of the view to the top and bottom edges of it's superview.

     - Parameter offset: How far to offset the top and bottom edges of the view from the top and bottom edges of its superview.
     - Parameter priority: The priority of the constraints.

     - Returns: The `top` and `bottom` constraint objects or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func pinToTopAndBottomEdgesOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?) {
        return (
            self.pinToTopEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToBottomEdgeOfSuperview(withOffset: offset, priority: priority)
        )
    }

}

// MARK: - Pin: Edges
extension UIView {

    /**
    Pin the top edge of the view to the top edge of another item.

    - Parameter item: Constrain the top edge of the view to the top edge of this item, it may be a view or layout guide.
    - Parameter offset: How far to offset the top edge of the view from the top edge of the item.
    - Parameter priority: The priority of the constraint.

    - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
    */
    @discardableResult
    public func pinTopEdgeToTopEdge(of item: Any, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .top, toAttribute: .top, ofItem: item, offset: offset, priority: priority)
    }

    /**
     Pin the right edge of the view to the right edge of another item.

     - Parameter item: Constrain the right edge of the view to the right edge of this item, it may be a view or layout guide.
     - Parameter offset: How far to offset the right edge of the view from the right edge of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func pinRightEdgeToRightEdge(of item: Any, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .right, toAttribute: .right, ofItem: item, offset: -offset, priority: priority)
    }

    /**
     Pin the bottom edge of the view to the bottom edge of another item.

     - Parameter item: Constrain the bottom edge of the view to the bottom edge of this item, it may be a view or layout guide.
     - Parameter offset: How far to offset the bottom edge of the view from the bottom edge of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func pinBottomEdgeToBottomEdge(of item: Any, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .bottom, toAttribute: .bottom, ofItem: item, offset: -offset, priority: priority)
    }

    /**
     Pin the left edge of the view to the left edge of another item.

     - Parameter item: Constrain the left edge of the view to the left edge of this item, it may be a view or layout guide.
     - Parameter offset: How far to offset the left edge of the view from the left edge of the item.
     - Parameter priority: The priority of the constraint.
     
     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func pinLeftEdgeToLeftEdge(of item: Any, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .left, toAttribute: .left, ofItem: item, offset: offset, priority: priority)
    }
    
}

// MARK: - Center
extension UIView {

    /**
    Center the view horizontally and vertically within it's superview.

    - Parameter offset: How far to horizontal and vertical offset the center of the view from the superview's center.
    - Parameter priority: The priority of the constraints.
    
    - Returns: The `horizontal` and `vertical` constraint objects or `nil` if the constraint could not be made because the view does not have a super view.
    */
    @discardableResult
    public func centerInSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (horizontal: NSLayoutConstraint?, vertical: NSLayoutConstraint?){
        return (
            self.centerHorizontallyInSuperview(withOffset: offset, priority: priority),
            self.centerVerticallyInSuperview(withOffset: offset, priority: priority)
        )
    }

    /**
     Center the view horizontally within it's super view.

     - Parameter offset: How far to horizontally offset the center of the view from the superview's center.
     - Parameter priority: The priority of the constraint.
     
     - Returns: The constraint object or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func centerHorizontallyInSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .centerX, offset: offset, priority: priority)
    }

    /**
     Center the view vertical within it's super view.

     - Parameter offset: How far to vertical offset the center of the view from the superview's center.
     - Parameter priority: The priority of the constraint.
     
     - Returns: The constraint object or `nil` if the constraint could not be made because the view does not have a super view.
     */
    @discardableResult
    public func centerVerticallyInSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .centerY, offset: offset, priority: priority)
    }

    /**
     Center the views horizontally within a view.

     - Parameter views: The views to center horizontally.
     - Parameter separation: The separation between the views.
     - Parameter priority: The priority of the constraints.
     */
    public func centerHorizontally(_ views: [UIView], withSeparation separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count % 2 == 0 { // even
            let rightIndex = views.count/2
            let leftIndex = rightIndex-1

            _ = views[leftIndex].constrain(attribute: .right, toAttribute: .centerX, ofItem: self, relatedBy: .lessThanOrEqual, offset:-separation/2, priority: priority)
            _ = views[rightIndex].constrain(attribute: .left, toAttribute: .centerX, ofItem: self, relatedBy: .lessThanOrEqual, offset:separation/2, priority: priority)

            if views.count > 2 {
                let rightViews = Array(views[rightIndex+1...views.count-1])
                if rightViews.count > 0 {
                    views[rightIndex].positionToTheRight(views: rightViews, offset: separation, priority: priority)
                }

                let leftViews = Array(views[0...leftIndex-1])
                if leftViews.count > 0 {
                    views[leftIndex].positionToTheLeft(views: leftViews, offset: separation, priority: priority)
                }
            }
        } else { // odd
            let centerIndex = views.count/2
            views[centerIndex].centerHorizontallyInSuperview()

            if views.count > 1 {
                let rightViews = Array(views[centerIndex+1...views.count-1])
                if rightViews.count > 0 {
                    views[centerIndex].positionToTheRight(views: rightViews, offset: separation, priority: priority)
                }

                let leftViews = Array(views[0...centerIndex-1])
                if leftViews.count > 0{
                    views[centerIndex].positionToTheLeft(views: leftViews, offset: separation, priority: priority)
                }
            }
        }
    }

    /**
     Center the views vertically within a view.

     - Parameter views: The views to center vertically.
     - Parameter separation: The separation between the views.
     - Parameter priority: The priority of the constraints.
     */
    public func centerVertically(_ views: [UIView], withSeparation separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count % 2 == 0 { // even
            let belowIndex = views.count/2
            let aboveIndex = belowIndex-1

            _ = views[aboveIndex].constrain(attribute: .bottom, toAttribute: .centerY, ofItem: self, relatedBy: .lessThanOrEqual, offset:-separation/2, priority: priority)
            _ = views[belowIndex].constrain(attribute: .top, toAttribute: .centerY, ofItem: self, relatedBy: .lessThanOrEqual, offset:separation/2, priority: priority)

            if views.count > 2 {
                let belowViews = Array(views[belowIndex+1...views.count-1])
                if belowViews.count > 0 {
                    views[belowIndex].positionBelow(views: belowViews, offset: separation, priority: priority)
                }

                let aboveViews = Array(views[0...aboveIndex-1])
                if aboveViews.count > 0 {
                    views[aboveIndex].positionAbove(views: aboveViews, offset: separation, priority: priority)
                }
            }
        }else{ // ood
            let centerIndex = views.count/2
            views[centerIndex].centerVerticallyInSuperview()

            if views.count > 1 {
                let belowViews = Array(views[centerIndex+1...views.count-1])
                if belowViews.count > 0 {
                    views[centerIndex].positionBelow(views: belowViews, offset: separation, priority: priority)
                }

                let aboveViews = Array(views[0...centerIndex-1])
                if aboveViews.count > 0{
                    views[centerIndex].positionAbove(views: aboveViews, offset: separation, priority: priority)
                }
            }
        }
    }

    /**
     Center the view horizontally to an item.

     - Parameter item: Constraint the horizontal axis of the view to this item, it may be a view or layout guide.
     - Parameter offset: How far to horizontally offset the center of the view from the item's center.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func centerHorizontally(to item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .centerX, toAttribute: .centerX, ofItem: item, offset: offset, priority: priority)
    }

    /**
     Center the view vertically to an item.

     - Parameter item: Constraint the vertical axis of the view to this item, it may be a view or layout guide.
     - Parameter offset: How far to vertically offset the center of the view from the item's center.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func centerVertically(to item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .centerY, toAttribute: .centerY, ofItem: item, offset: offset, priority: priority)
    }

}

// MARK: - Size
extension UIView {
    
    /**
    Constrain the width of the view.

    - Parameter width: The width to constrain the view to.
    - Parameter priority: The priority of the constraint.

    - Returns: The constraint object.
    */
    @discardableResult
    public func size(toWidth width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .width, size: width, priority: priority)
    }

    /**
     Constrain the minimum width of the view.

     - Parameter width: The minimum width to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object.
     */
    @discardableResult
    public func size(toMinWidth width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .width, size: width, relatedBy: .greaterThanOrEqual, priority: priority)
    }

    /**
     Constrain the maximum width of the view.

     - Parameter width: The maximum width to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object.
     */
    @discardableResult
    public func size(toMaxWidth width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .width, size: width, relatedBy: .lessThanOrEqual, priority: priority)
    }

    /**
     Constrain the height of the view.

     - Parameter height: The height to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object.
     */
    @discardableResult
    public func size(toHeight height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .height, size: height, priority: priority)
    }

    /**
     Constrain the minimum height of the view.

     - Parameter height: The minimum height to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object.
     */
    @discardableResult
    public func size(toMinHeight height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .height, size: height, relatedBy: .greaterThanOrEqual, priority: priority)
    }

    /**
     Constrain the maximum height of the view.

     - Parameter height: The maximum height to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object.
     */
    @discardableResult
    public func size(toMaxHeight height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .height, size: height, relatedBy: .lessThanOrEqual, priority: priority)
    }

    /**
     Constrain the width and height of the view.

     - Parameter size: The width and height to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The `width` and `height` constraint objects.
     */
    @discardableResult
    public func size(toWidthAndHeight size: CGFloat, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.size(toWidth: size, priority: priority),
            self.size(toHeight: size, priority: priority)
        )
    }

    /**
     Constrain the minimum width and height of the view.

     - Parameter size: The minumum width and height to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The `width` and `height` constraint objects.
     */
    @discardableResult
    public func size(toMinWidthAndHeight size: CGFloat, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.size(toMinWidth: size, priority: priority),
            self.size(toMinHeight: size, priority: priority)
        )
    }

    /**
     Constrain the maximum width and height of the view.

     - Parameter size: The maximum width and height to constrain the view to.
     - Parameter priority: The priority of the constraint.

     - Returns: The `width` and `height` constraint objects.
     */
    @discardableResult
    public func size(toMaxWidthAndHeight size: CGFloat, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.size(toMaxWidth: size, priority: priority),
            self.size(toMaxHeight: size, priority: priority)
        )
    }

    /**
     Constrain the width of the view to the width of an item.

     - Parameter item: Constrain the width of the view to the width of the item, it may be a view or layout guide.
     - Parameter offset: How far to offset the width of the view from the width of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func sizeWidthToWidth(ofItem item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .width, toAttribute: .width, ofItem: item, offset: -offset, priority: priority)
    }

    /**
     Constrain the height of the view to the height of an item.

     - Parameter item: Constrain the height of the view to the height of the item, it may be a view or layout guide.
     - Parameter offset: How far to offset the height of the view from the height of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func sizeHeightToHeight(ofItem item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .height, toAttribute: .height, ofItem: item, offset: -offset, priority: priority)
    }

    /**
     Constrain the height of the view to the width of an item.

     - Parameter item: Constrain the height of the view to the width of this item, it may be a view or layout guide.
     - Parameter offset: How far to offset the height of the view from the width of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func sizeHeightToWidth(ofItem item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .height, toAttribute: .width, ofItem:item, offset: -offset, priority: priority)
    }

    /**
     Constrain the width of the view to the height of an item.

     - Parameter item: Constrain the width of the view to the height of this item, it may be a view or layout guide.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func sizeWidthToHeight(ofItem item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .width, toAttribute: .height, ofItem:item, offset: -offset, priority: priority)
    }

    /**
     Constrain the width and height of the view to the width and height of an item.

     - Parameter item: Constrain the width and height of the view to the width and height of the item, it may be a view or layout guide.
     - Parameter priority: The priority of the constraints.

     - Returns: The `width` and `height` constraint objects or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func sizeWidthAndHeightToWidthAndHeight(ofItem item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint?, height: NSLayoutConstraint?) {
        return (
            self.sizeWidthToWidth(ofItem: item, offset: offset, priority: priority),
            self.sizeHeightToHeight(ofItem: item, offset: offset, priority: priority)
        )
    }

    /**
     Constrain the height to a width aspect ratio.

     - Parameter aspectRatio: The aspect ratio of the width to constrain the height to.
     - Parameter priority: The priority of the constraints.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func sizeHeightToWidth(withAspectRatio aspectRatio: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .height, toAttribute: .width, ofItem: self, multiplier: aspectRatio, priority: priority)
    }

    /**
     Constrain the width to a height aspect ratio.

     - Parameter aspectRatio: The aspect ratio of the height to constrain the width to.
     - Parameter priority: The priority of the constraints.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func sizeWidthToHeight(withAspectRatio aspectRatio: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .width, toAttribute: .height, ofItem: self, multiplier: aspectRatio, priority: priority)
    }

}

// MARK: - Position
extension UIView {
    
    /**
    Position the view above an item.

    - Parameter item: Position the view above this item, it may be a view or layout guide.
    - Parameter offset: How far to offset(seperate) the bottom of the view from the top of the item.
    - Parameter priority: The priority of the constraint.

    - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
    */
    @discardableResult
    public func positionAbove(item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .bottom, toAttribute:.top, ofItem:item, offset:-offset, priority: priority)
    }

    /**
     Position the view to the right of an item.

     - Parameter item: Position the view to the right of this item, it may be a view or layout guide.
     - Parameter offset: How far to offset(seperate) the left of the view from the right of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func positionToTheRight(ofItem item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .left, toAttribute:.right, ofItem:item, offset:offset, priority: priority)
    }

    /**
     Position the view below an item.

     - Parameter item: Position the view below this item, it may be a view or layout guide.
     - Parameter offset: How far to offset(seperate) the top of the view from the bottom of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func positionBelow(item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .top, toAttribute:.bottom, ofItem:item, offset:offset, priority: priority)
    }


    /**
     Position the view to the left of an item.

     - Parameter item: Position the view to the left of this item, it may be a view or layout guide.
     - Parameter offset: How far to offset(seperate) the right of the view from the left of the item.
     - Parameter priority: The priority of the constraint.

     - Returns: The constraint object or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func positionToTheLeft(ofItem item: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .right, toAttribute:.left, ofItem:item, offset:-offset, priority: priority)
    }

    /**
     Position the views above the view.

     - Parameter views: The views to position above the view. Views are positioned in order from top to bottom.
     - Parameter offset: How far to offset(seperate) the views.
     - Parameter priority: The priority of the constraints.
     */
    public func positionAbove(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in views.reversed() {
            view.positionAbove(item: lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

    /**
     Position the views to the right of the view.

     - Parameter views: The views to position to the right of the view.
     - Parameter offset: How far to offset(seperate) the views.
     - Parameter priority: The priority of the constraints.
     */
    public func positionToTheRight(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in views {
            view.positionToTheRight(ofItem: lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

    /**
     Position the views below the view.

     - Parameter views: The views to position below the view.
     - Parameter offset: How far to offset(seperate) the views.
     - Parameter priority: The priority of the constraints.
     */
    public func positionBelow(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in views {
            view.positionBelow(item: lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

    /**
     Position the views to the left of the view.

     - Parameter views: The views to position to the left of the view. Views are positioned in order from left to right.
     - Parameter offset: How far to offset(seperate) the views.
     - Parameter priority: The priority of the constraints.
     */
    public func positionToTheLeft(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in views.reversed() {
            view.positionToTheLeft(ofItem: lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

}

// MARK: - Between
extension UIView {
    
    /**
    Fit the view between the top and bottom items.

    - Parameter topItem: The top item to fit below.
    - Parameter bottomItem: The bottom item to fit below.
    - Parameter offset: How far to offset(seperate) the view from the top and bottom items.
    - Parameter priority: The priority of the constraints.

    - Returns: The top and bottom constraint objects or `nil` if the constraint could not be made because the views do not share a common super view.
    */
    @discardableResult
    public func fitBetween(topItem: Any, bottomItem: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?){
        return (
            self.positionBelow(item: topItem, offset: offset, priority: priority),
            self.positionAbove(item: bottomItem, offset: offset, priority: priority)
        )
    }

    /**
     Fit the view between the left and right items.

     - Parameter leftItem: The left item to fit below.
     - Parameter rightItem: The right item to fit below.
     - Parameter offset: How far to offset(seperate) the view from the top and bottom items.
     - Parameter priority: The priority of the constraints.

     - Returns: The left and right constraint objects or `nil` if the constraint could not be made because the views do not share a common super view.
     */
    @discardableResult
    public func fitBetween(leftItem: Any, rightItem: Any, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (left: NSLayoutConstraint?, right: NSLayoutConstraint?){
        return (
            self.positionToTheRight(ofItem: leftItem, offset: offset, priority: priority),
            self.positionToTheLeft(ofItem: rightItem, offset: offset, priority: priority)
        )
    }
    
}

// MARK: - Fill
extension UIView {
    
    /**
    Horizontally layout and fill the view with views.

    - Parameter views: An array of views to horizontally layout and fill the view with.
    - Parameter separation: The separation between the views.
    - Parameter priority: The priority of the constraints.
    */
    public func fillHorizontally(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count == 1 {
            views.first?.pinToSideEdgesOfSuperview(withOffset: separation, priority: priority)
            return
        }

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                lastView.sizeWidthToWidth(ofItem: view)
                view.positionToTheRight(ofItem: lastView, offset: separation, priority: priority)
            } else {
                view.pinToLeftEdgeOfSuperview(withOffset: separation, priority: priority)
            }
            lastView = view
        }

        _ = lastView?.pinToRightEdgeOfSuperview(withOffset: separation, priority: priority)
    }

    /**
     Vertically layout and fill the view with views.

     - Parameter views: An array of views to vertically layout and fill the view with.
     - Parameter separation: The separation between the views.
     - Parameter priority: The priority of the constraints.
     */
    public func fillVertically(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count == 1 {
            views.first?.pinToTopAndBottomEdgesOfSuperview(withOffset: separation, priority: priority)
            return
        }

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                lastView.sizeHeightToHeight(ofItem: view)
                view.positionBelow(item: lastView, offset: separation, priority: priority)
            } else {
                view.pinToTopEdgeOfSuperview(withOffset: separation, priority: priority)
            }
            lastView = view
        }

        _ = lastView?.pinToBottomEdgeOfSuperview(withOffset: separation, priority: priority)
    }

}

// MARK: - Bound
extension UIView {
    
    /**
    Horizontally layout views and then bound the left and right edges of the view to the left and right edges of the first and last views.
    This method is useful for filling scroll views with views becuase the passed views will be laid out,
    and then the calling view(scroll view) will be bound to their total width.

    - Parameter views: An array of views to layout horizontally. The left and right edges of the view are bound to the left and right edges of first and last views.
    - Parameter separation: The separation between the views.
    - Parameter priority: The priority of the constraints.
    */
    public func boundHorizontally(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count > 1 {
            var lastView: UIView!
            for view in views {
                if lastView != nil{
                    view.positionToTheRight(ofItem: lastView, offset: separation, priority: priority)
                }
                lastView = view
            }
        }

        self.pinLeftEdgeToLeftEdge(of: views.first!, withOffset: -separation, priority: priority)
        self.pinRightEdgeToRightEdge(of: views.last!, withOffset: -separation, priority: priority)
    }

    /**
     Vertically layout views and then bound the top and bottom edges of the view to the top and bottom edges of the first and last views.
     This method is useful for filling scroll views with views becuase the passed views will be laid out,
     and then the calling view(scroll view) will be bound to their total height.

     - Parameter views: An array of views to layout vertically. The top and bottom edges of the view are bound to the top and bottom edges of first and last views.
     - Parameter separation: The separation between the views.
     - Parameter priority: The priority of the constraints.
     */
    public func boundVertically(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count > 1 {
            var lastView: UIView!
            for view in views {
                if lastView != nil {
                    view.positionBelow(item: lastView, offset: separation, priority: priority)
                }
                lastView = view
            }
        }

        self.pinTopEdgeToTopEdge(of: views.first!, withOffset: -separation, priority: priority)
        self.pinBottomEdgeToBottomEdge(of: views.last!, withOffset: -separation, priority: priority)
    }

}

// MARK: - General
extension UIView {

    /**
    Wrapper for the standard `NSLayoutConstraint` with some default values added for ease of use.
    This method adds the constraint to the view. This is the core method that every method in `KGNAutoLayout` uses deep down.

    - Parameter item: The item to constrain.
    - Parameter attribute: The attribute of the `item` to constrain.
    - Parameter toItem: The item to constrain the `item` to, defaults to nil.
    - Parameter attribute: The attribute of the `toItem` to constrain the `item` `attribute` to, defaults to `NotAnAttribute`.
    - Parameter relatedBy: The relation of the two items, deffaults to `Equal`.
    - Parameter multiplier: The multiplier of the constraint, defaults to `1`.
    - Parameter offset: The offset(`constant`) of the constraint, defaults to `0`.
    - Parameter priority: The priority of the constraint, defaults to `nil`.

    - Returns: The constraint object.
    */
    @discardableResult
    public func constrain(item: Any, attribute itemAttribute: NSLayoutAttribute, toItem: Any? = nil, attribute toAttribute: NSLayoutAttribute = .notAnAttribute, relatedBy: NSLayoutRelation = .equal, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        if let view = item as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint = NSLayoutConstraint(
            item: item, attribute: itemAttribute,
            relatedBy: relatedBy,
            toItem: toItem, attribute: toAttribute,
            multiplier: multiplier, constant: offset
        )
        if priority != nil {
            constraint.priority = priority!
        }
        self.addConstraint(constraint)
        return constraint
    }
}

// MARK: - Private
extension UIView {

    fileprivate func constrain(sizeAttribute: NSLayoutAttribute, size: CGFloat = 0, relatedBy: NSLayoutRelation = .equal, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(item: self, attribute: sizeAttribute, relatedBy: relatedBy, multiplier: 0, offset: size, priority: priority)
    }

    fileprivate func constrain(edgeAttribute: NSLayoutAttribute, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        guard let superview = self.superview else {
            return nil
        }

        return superview.constrain(item: self, attribute: edgeAttribute, toItem: superview, attribute: edgeAttribute, offset: offset, priority: priority)
    }

    fileprivate func constrain(attribute: NSLayoutAttribute, toAttribute itemAttribute: NSLayoutAttribute, ofItem item: Any, relatedBy: NSLayoutRelation = .equal, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        let commonSuperview: UIView? = {
            guard let view = item as? UIView else {
                return self.superview
            }
            
            return {
                var startView: UIView! = self
                var commonSuperview: UIView?
                repeat {
                    if view.isDescendant(of: startView) {
                        commonSuperview = startView
                    }
                    startView = startView.superview
                } while (startView != nil && commonSuperview == nil)
                return commonSuperview
            }()
        }()
        
        assert(commonSuperview != nil, "Can't create constraints without a common super view")
        if commonSuperview == nil {
            return nil
        }
        
        return commonSuperview!.constrain(item: self, attribute: attribute, toItem: item, attribute: itemAttribute, relatedBy: relatedBy, multiplier: multiplier, offset: offset, priority: priority)
    }
    
}
