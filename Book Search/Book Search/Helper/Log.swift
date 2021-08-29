//
//  Log.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import Foundation


class Log {
    
    enum LogEvent: String {
        case e = "[‼️]" // error
        case i = "[ℹ️]" // info
        case d = "[💬]" // debug
        case v = "[🔬]" // verbose
        case w = "[⚠️]" // warning
        case repository = "[🎲]"
        case viewModel = "[🛠]"
        case network = "[🌍]"
        case api = "[☁️]"
        case database = "[🛢]"
    }
    

    private static let activeLogs: [LogEvent] = [
        .e
        ,.i
        ,.d
        ,.v
        ,.w
        ,.repository
        ,.viewModel
        ,.network
        ,.api
        ,.database
    ]
    
    
    class func event(_ event: LogEvent, _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: event, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }

    class func e( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .e, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }

    class func i( _ object: @autoclosure () -> Any? = nil,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .i, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }
    
    class func d( _ object: @autoclosure () -> Any? = nil,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .d, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }

    class func v( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .v, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }
    
    class func w( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .w, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }

    
    class func repository( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .repository, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }
    
    
    class func viewModel( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .viewModel, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }
    
    
    class func network( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .network, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }
    
    
    class func api( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .api, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }
    
    
    class func database( _ object: @autoclosure () -> Any?,
        filename: String = #file,
        line: Int = #line,
        funcName: String = #function) {

        #if DEBUG
        print(event: .database, "[\(sourceFileName(filePath: filename))]:\(line) \(funcName) | \(object() ?? "")")
        #endif
    }

    
    //MARK: - Helpers
    // You can use your own datetime format
    fileprivate static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    
    fileprivate static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }

    private class func print(event: LogEvent, _ object: Any) {
        #if DEBUG
        if activeLogs.contains(event) {
            Swift.print("\(Date().toLogString()) \(event.rawValue)\(object)")
        }
        #endif
    }
}


extension Date {

    func toLogString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }

}
