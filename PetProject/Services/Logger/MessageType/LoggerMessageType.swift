//
//  Created by Mikhail Muzhev on 25/09/2019.
//  Copyright © 2019 Mikhail Muzhev. All rights reserved.
//

import Foundation

protocol LoggerMessageType {
    var prefix: String {
        get
    }
}

enum LoggerType {

    case `default`
    case debug
    case success
    case error
    case warning

    var value: LoggerMessageType {
        switch self {
        case .default:
            return DefaultLoggerType()
        case .debug:
            return DebugLoggerType()
        case .error:
            return ErrorLoggerType()
        case .success:
            return SuccessLoggerType()
        case .warning:
            return WarningLoggerType()
        }
    }

}
