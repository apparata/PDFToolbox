//
//  Copyright © 2016 Apparata AB. All rights reserved.
//

import Foundation
import CoreGraphics

public class PDFContext {
    
    /// Opaque Core Graphics representation of context.
    public private(set) var context: CGContext!
    
    public enum PDFError: Error {
        case failedToCreateContext
    }
    
    public init(createAtURL: URL) throws {
        if let pdfContext = CGContext(createAtURL as CFURL, mediaBox: nil, nil) {
            context = pdfContext
        } else {
            throw PDFError.failedToCreateContext
        }
    }
    
    public func beginPage(_ rect: CGRect = CGRect(origin: CGPoint.zero, size: PaperSize.A4)) {
        var mediaBox = rect
        context.beginPage(mediaBox: &mediaBox)
    }
    
    public func beginPage(_ pageSize: CGSize = PaperSize.A4) {
        beginPage(CGRect(origin: CGPoint.zero, size: pageSize))
    }
    
    public func endPage() {
        context.endPage()
    }
    
    public func pushState() {
        context.saveGState()
    }
    
    public func popState() {
        context.restoreGState()
    }
    
    public func clipToRect(_ rect: CGRect) {
        context.clip(to: rect)
    }
    
    public func drawPDFPage(_ page: PDFPage) {
        context.drawPDFPage(page.page)
    }
}

