//
//  Created by Mikhail Muzhev on 25/09/2019.
//  Copyright © 2019 Mikhail Muzhev. All rights reserved.
//

import Foundation

struct Logger {

    static func log(type: LoggerType = .default, message: Any) {
        print("\(type.value.prefix)\(message)")
    }

}
