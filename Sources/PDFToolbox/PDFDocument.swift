//
//  Copyright © 2016 Apparata AB. All rights reserved.
//

import Foundation
import CoreGraphics

public class PDFDocument {
    
    /// Opaque Core Graphics representation of document.
    public private(set) var document: CGPDFDocument!
    
    public var pageCount: Int {
        return document.numberOfPages
    }
    
    public enum PDFError: Error {
        case failedToOpenDocument
    }
    
    public init(url: URL) throws {
        if let pdfDocument = CGPDFDocument(url as CFURL) {
            document = pdfDocument
        } else {
            throw PDFError.failedToOpenDocument
        }
    }
    
    /// Return page corresponding to the specified page number, or nil if no
    /// such page exists in the document. Pages are numbered starting at 1.
    public func page(_ pageIndex: Int) -> PDFPage? {
        guard let page = document.page(at: pageIndex) else {
            return nil
        }
        return PDFPage(document: self, page: page)
    }
    
    /// Return page corresponding to the specified page number, or nil if no
    /// such page exists in the document. Pages are numbered starting at 1.
    public subscript(pageIndex: Int) -> PDFPage? {
        return page(pageIndex)
    }
}

public class PDFPage {
    
    /// Opaque Core Graphics representation of page.
    public let page: CGPDFPage
    
    public private(set) weak var document: PDFDocument?
    
    /// A rectangle, expressed in default user space units, that defines the
    /// boundaries of the physical medium on which the page is intended to be
    /// displayed or printed.
    public var mediaBox: CGRect {
        return page.getBoxRect(.mediaBox)
    }
    
    /// A rectangle, expressed in default user space units, that defines the
    /// visible region of default user space. When the page is displayed or
    /// printed, its contents are to be clipped to this rectangle.
    public var cropBox: CGRect {
        return page.getBoxRect(.cropBox)
    }
    
    /// A rectangle, expressed in default user space units, that defines the
    /// region to which the contents of the page should be clipped when output
    /// in a production environment.
    public var bleedBox: CGRect {
        return page.getBoxRect(.bleedBox)
    }
    
    /// A rectangle, expressed in default user space units, that defines the
    /// intended dimensions of the finished page after trimming.
    public var trimBox: CGRect {
        return page.getBoxRect(.trimBox)
    }
    
    /// A rectangle, expressed in default user space units, defining the extent
    /// of the page’s meaningful content (including potential white space) as
    /// intended by the page’s creator.
    public var artBox: CGRect {
        return page.getBoxRect(.artBox)
    }
    
    /// The rotation angle (in degrees) of the specified page.
    public var rotationAngle: Int {
        return Int(page.rotationAngle)
    }
    
    /// Returns the page number in the document.
    public var pageNumber: Int {
        return page.pageNumber
    }
    
    internal init(document: PDFDocument, page: CGPDFPage) {
        self.document = document
        self.page = page
    }
}
