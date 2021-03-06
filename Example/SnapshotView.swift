//
//  SnapshotView.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/23/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

public enum CacheError: ErrorType {
    case NoCacheDirectory
}

class SnapshotView: UIView {

    class func cacheDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
    }

    func saveSnapshot(imageName: String, _ code: String...) {
        self.layoutIfNeeded()

        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        if !self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true) {
            assert(true, "Screenshot failed")
            return
        }
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            assert(true, "nil image")
            return
        }
        UIGraphicsEndImageContext()

        let cachePath = "\(SnapshotView.cacheDirectory())/\(imageName).png"
        let imageData = UIImagePNGRepresentation(image)
        imageData?.writeToFile(cachePath, atomically: true)

        print("")

        print("``` Swift")
        for line in code {
            print(line)
        }
        print("```")

        print("![\(imageName)](Example/Snapshots/\(imageName).png)")

        print("--")
        print("")
    }

    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 280, height: 280)
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        let spaceing: CGFloat = 40
        let lineOffset: CGFloat = 0.5
        let lineColor = UIColor(white: 1, alpha: 0.2)
        let context = UIGraphicsGetCurrentContext()

        CGContextSetRGBFillColor(context, 0.1373, 0.5412, 0.9412, 1)
        CGContextFillRect(context, rect)

        CGContextSetLineWidth(context, 1)
        CGContextSetLineCap(context, .Round)
        CGContextSetStrokeColorWithColor(context, lineColor.CGColor)
        CGContextSetLineDash(context, 0, [2, 2], 2)

        var x = spaceing
        while x < rect.maxX {
            var innerX = x
            if x > rect.midX {
                innerX += lineOffset
            } else {
                innerX -= lineOffset
            }
            CGContextSaveGState(context);
            CGContextMoveToPoint(context, innerX, rect.minY);
            CGContextAddLineToPoint(context, innerX, rect.maxY);
            CGContextStrokePath(context);
            CGContextRestoreGState(context);
            x += spaceing
        }

        var y = spaceing
        while y < rect.maxY {
            var innerY = y
            if y > rect.midX {
                innerY += lineOffset
            } else {
                innerY -= lineOffset
            }
            CGContextSaveGState(context);
            CGContextMoveToPoint(context, rect.minX, innerY);
            CGContextAddLineToPoint(context, rect.maxX, innerY);
            CGContextStrokePath(context);
            CGContextRestoreGState(context);
            y += spaceing
        }
    }

}
