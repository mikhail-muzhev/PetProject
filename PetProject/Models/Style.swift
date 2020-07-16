//
//  Created by Mikhail Muzhev on 08/02/2019.
//  Copyright © 2019 Mikhail Muzhev. All rights reserved.
//

import UIKit

public struct Style<View: UIView> {
    
    public let style: (View) -> Void
    
    public init(_ style: @escaping (View) -> Void) {
        self.style = style
    }
    
    public func apply(to view: View) {
        style(view)
    }
    
}

enum DefaultStyle {

    static let label = Style<AttributedLabel> {
        $0.textColor = .black
    }

}

// swiftlint:disable type_body_length

enum LabelStyle {

    case whiteBoldRight24
    case whiteMediumRight20
    case whiteMediumLeft15
    case whiteMediumLeft17
    case whiteMediumLeft20
    case whiteRegularCenter17
    case blackSemiboldCenter17
    case blackBoldCenter17
    case blackBoldCenter21
    case blackRegularCenter13
    case blackRegularCenter15
    case greenMediumLeft14
    case greenBoldCenter17
    case greenMediumLeft17
    case whiteMediumCenter20
    case greenBoldCenter17Disabled
    
    case blackBoldLeft24
    case grayBoldLeft12
    case grayMediumRight14
    case greenBoldLeft18
    case greenBoldLeft20
    case greenBoldLeft24
    case redRegularRight14
    case redRegularLeft14
    case lightGreenMediumCenter17
    case lightGreenMediumCenter17Disabled
    
    case whiteRegularRight18
    case whiteRegularRight16
    case whiteRegularLeft15
    
    case blueRegularCenter17
    case blueSemiboldCenter17

    var value: Style<AttributedLabel> {
        switch self {
        case .whiteBoldRight24:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 24)
                $0.textColor = .white
                $0.lineHeight = 30
                $0.numberOfLines = 0
            }
        case .blueRegularCenter17:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 17)
                $0.textColor = .blue
                $0.textAlignment = .center
                $0.lineBreakMode = .byWordWrapping
                $0.numberOfLines = 0
            }
        case .blueSemiboldCenter17:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 17)
                $0.textColor = .blue
                $0.textAlignment = .center
                $0.lineBreakMode = .byWordWrapping
                $0.numberOfLines = 0
            }
        case .blackRegularCenter13:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 13)
                $0.textColor = .black
                $0.lineHeight = 18
                $0.textAlignment = .center
                $0.lineBreakMode = .byWordWrapping
                $0.numberOfLines = 0
            }
        case .blackRegularCenter15:
        return Style<AttributedLabel> {
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .black
            $0.lineHeight = 20
            $0.textAlignment = .center
            $0.lineBreakMode = .byWordWrapping
            $0.numberOfLines = 0
        }
        case .blackSemiboldCenter17:
            return Style<AttributedLabel> {
                $0.font = UIFont.preferredFont(forTextStyle: .subheadline).withSize(17)
                $0.textColor = .black
                $0.lineHeight = 22
                $0.lineBreakMode = .byWordWrapping
                $0.textAlignment = .center
                $0.numberOfLines = 0
            }
        case .whiteMediumRight20:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 20)
                $0.textColor = .white
                $0.lineHeight = 26
                $0.numberOfLines = 0
            }
        case .whiteMediumLeft15:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .white
                $0.textAlignment = .left
                $0.numberOfLines = 0
            }
        case .whiteMediumLeft17:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 17)
                $0.textColor = .white
                $0.textAlignment = .left
                $0.numberOfLines = 0
            }
        case .whiteMediumLeft20:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 20)
                $0.textColor = .white
                $0.textAlignment = .left
                $0.lineHeight = 26
                $0.numberOfLines = 0
            }
        case .whiteRegularCenter17:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 17)
                $0.textColor = .white
                $0.textAlignment = .center
                $0.numberOfLines = 0
            }
        case .greenBoldLeft18:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 18)
                $0.textColor = .green
                $0.lineHeight = 23
                $0.textAlignment = .left
            }
        case .greenBoldCenter17:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 17)
                $0.textColor = .green
            }
        case .greenBoldCenter17Disabled:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 17)
                $0.textColor = .lightGray
            }
        case .greenMediumLeft14:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 14)
                $0.textColor = .green
                $0.textAlignment = .left
            }
        case .greenMediumLeft17:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 17)
                $0.lineHeight = 22
                $0.textAlignment = .left
                $0.textColor = .green
            }
        case .whiteMediumCenter20:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 20)
                $0.textColor = .white
            }
        case .blackBoldLeft24:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.greenBoldLeft24.value)
                $0.lineBreakMode = .byWordWrapping
                $0.textColor = .black
            }
        case .blackBoldCenter17:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 17)
                $0.lineHeight = 20
                $0.lineBreakMode = .byWordWrapping
                $0.textAlignment = .center
                $0.textColor = .black
            }
        case .blackBoldCenter21:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 21)
                $0.lineHeight = 27
                $0.lineBreakMode = .byWordWrapping
                $0.textAlignment = .center
                $0.textColor = .black
            }
        case .grayBoldLeft12:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 12)
                $0.textColor = UIColor.black.withAlphaComponent(0.5)
                $0.textAlignment = .left
            }
        case .greenBoldLeft20:
            return Style<AttributedLabel> {
                $0.font = .boldSystemFont(ofSize: 20)
                $0.textAlignment = .left
                $0.textColor = .green
            }
        case .greenBoldLeft24:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.greenBoldLeft20.value)
                $0.font = .boldSystemFont(ofSize: 24)
            }
        case .redRegularRight14:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 14)
                $0.textColor = .red
                $0.textAlignment = .center
            }
        case .redRegularLeft14:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 14)
                $0.textColor = .red
                $0.numberOfLines = 0
                $0.lineBreakMode = .byWordWrapping
                $0.textAlignment = .left
            }
        case .lightGreenMediumCenter17:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 17)
                $0.underlineStyle = NSUnderlineStyle.single.rawValue
                $0.textColor = .green
            }
        case .lightGreenMediumCenter17Disabled:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.lightGreenMediumCenter17.value)
                $0.textColor = UIColor.green.withAlphaComponent(0.5)
            }
        case .grayMediumRight14:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 14)
                $0.lineHeight = 22
                $0.textColor = UIColor.black.withAlphaComponent(0.5)
            }
        case .whiteRegularRight18:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 18)
                $0.textColor = .white
                $0.lineHeight = 27
                $0.numberOfLines = 0
            }
        case .whiteRegularRight16:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 16)
                $0.textColor = .white
                $0.lineHeight = 17
                $0.numberOfLines = 0
            }
        case .whiteRegularLeft15:
            return Style<AttributedLabel> {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .white
                $0.lineHeight = 19
                $0.textAlignment = .left
            }
        }
    }

    var stringAttributes: [NSAttributedString.Key: Any] {
        let label = AttributedLabel(text: " ", style: self)
        label.apply(self.value)
        guard let attributes = label.attributedText?.attributes(at: 0, effectiveRange: nil) else { return [:] }
        return attributes
    }

}
