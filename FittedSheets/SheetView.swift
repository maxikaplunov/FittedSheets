//
//  SheetView.swift
//  FittedSheetsPod
//
//  Created by Gordon Tucker on 8/5/20.
//  Copyright © 2020 Gordon Tucker. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

class SheetView: UIView {

    weak var delegate: (SheetViewDelegate & UIViewController)?

//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        return self.delegate?.sheetPoint(inside: point, with: event) ?? true
//    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            guard let view = super.hitTest(point, with: event) else {
                return nil
            }

        if self.delegate?.sheetPoint(inside: point, with: event) ?? true {
                return view
            }

        return delegate?.presentingViewController?.view.hitTest(point, with: event)
        }
    
}

#endif // os(iOS) || os(tvOS) || os(watchOS)
