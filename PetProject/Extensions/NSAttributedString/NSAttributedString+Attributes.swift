//
//  NSAttributedString+Attributes.swift
//  TemplateProject
//
//  Created by Mihail Muzhev on 30/04/2017.
//  Copyright © 2017 Mikhail Muzhev. All rights reserved.
//

import UIKit

extension NSAttributedString {

    convenience init(string: String?, style: LabelStyle) {
        let attributes = style.stringAttributes
        self.init(string: string ?? "", attributes: attributes)
    }
    
    // MARK: - Mutate
    
    func addLetterSpacing(_ value: CGFloat) -> NSAttributedString {
        guard let mutableCopy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        mutableCopy.addAttribute(NSAttributedString.Key.kern,
                                 value: value,
                                 range: NSRange(location: 0, length: length))
        return mutableCopy
    }
    
    // MARK: - NSParagraphStyle
    
    func addParagraphStyle(_ paragraphStyle: NSParagraphStyle) -> NSAttributedString {
        guard let mutableCopy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        mutableCopy.addAttribute(NSAttributedString.Key.paragraphStyle,
                                 value: paragraphStyle,
                                 range: NSRange(location: 0, length: length))
        return mutableCopy
    }
    
    // MARK: - Attributes
    
    func addMinimumLineHeight(_ value: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = value
        return addParagraphStyle(paragraphStyle)
    }
    
    func addMaximumLineHeight(_ value: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = value
        return addParagraphStyle(paragraphStyle)
    }
}

extension NSMutableAttributedString {

    func setAsLink(textToFind: String, linkURL: String) {
        let foundRange = self.mutableString.range(of: textToFind)
        guard foundRange.location != NSNotFound else {
            Logger.log(type: .warning, message: "text \"\(textToFind)\" for link not found ")
            return
        }
        addAttribute(.link, value: linkURL, range: foundRange)
    }

}
