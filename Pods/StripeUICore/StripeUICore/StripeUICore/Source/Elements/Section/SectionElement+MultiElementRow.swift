//
//  SectionElement+MultiElementRow.swift
//  StripeUICore
//
//  Created by Yuki Tokuhiro on 3/18/22.
//

import Foundation
import UIKit

public extension SectionElement {
    /// A simple container element that displays its child elements in a horizontal stackview
    @_spi(STP) final class MultiElementRow: ContainerElement {
        weak public var delegate: ElementDelegate?
        public lazy var view: UIView = {
            return SectionContainerView.MultiElementRowView(views: elements.map { $0.view })
        }()
        public let elements: [Element]
        
        public init(_ elements: [Element]) {
            self.elements = elements
            defer {
                elements.forEach {
                    $0.delegate = self
                }
            }
        }
    }
}
