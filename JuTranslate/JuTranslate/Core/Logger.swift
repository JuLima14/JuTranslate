//
//  Logger.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//
import SwiftyBeaver

enum LogPriority {
    case verbose
    case debug
    case info
    case warning
    case error
}

class Logger {
    private let log = SwiftyBeaver.self
    private let logFormat = "$CLOG[$L] - $DHH:mm:ss$d - $M$c"
    
    init() {
        if let configurationsPath = Bundle.main.path(forResource: "Configurations", ofType: "plist") {
            let dictRoot = NSDictionary(contentsOfFile: configurationsPath)
            guard let dict = dictRoot else {
                print("Couldn't load Configurations.plist - Logger is disabled")
                return
            }
            
            if let shouldShowOnConsole = dict["SWIFTY_BEAVER_CONSOLE"] as? Bool, shouldShowOnConsole == true {
                let console = ConsoleDestination()
                console.format = self.logFormat
                log.addDestination(console)
            }
            
            if let fileDestination = dict["SWIFTY_BEAVER_FILE_URL"] as? String {
                let file = FileDestination()
                file.logFileURL = URL(fileURLWithPath: fileDestination)
                file.format = self.logFormat
                log.addDestination(file)
            }
        }
    }
    
    func log(with priority: LogPriority, value: Any) {
        switch(priority) {
        case .verbose: log.verbose(value)
        case .debug: log.debug(value)
        case .info: log.info(value)
        case .warning: log.warning(value)
        case .error: log.error(value)
        }
    }
}
