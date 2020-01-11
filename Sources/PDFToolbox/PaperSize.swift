//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation
import CoreGraphics

public struct PaperSize {
    
    public let width: CGFloat
    
    public let height: CGFloat
    
    public var size: CGSize {
        CGSize(width: width, height: height)
    }
    
    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
}

public extension PaperSize {
    static let a0 = PaperSize(width: 2384, height: 3370)
    static let a1 = PaperSize(width: 1684, height: 2384)
    static let a2 = PaperSize(width: 1190, height: 1684)
    static let a3 = PaperSize(width: 842, height: 1190)
    static let a4 = PaperSize(width: 595, height: 842)
    static let a5 = PaperSize(width: 420, height: 595)
    static let a6 = PaperSize(width: 298, height: 420)
    static let a7 = PaperSize(width: 210, height: 298)
    static let a8 = PaperSize(width: 148, height: 210)
    static let letter = PaperSize(width: 612, height: 792)
    static let legal = PaperSize(width: 612, height: 1008)
    static let ledger = PaperSize(width: 792, height: 1224)
    static let tabloid = PaperSize(width: 1224, height: 792)
    static let executive = PaperSize(width: 522, height: 756)
}
