/*
 S - Single responsibility
 O - Open extesnion but  / close for the modification
 L -
 I -
 D -
 */
/*
 - Listing pet medicies
 - showing filter
 - ordering
 - account - Web kit ( core swiftui )
 */


// @State - Value , @StateObject - referece type
import SwiftUI

@Observable
class ViewModel {
    var count: Int = 0
}


struct ContentView: View {
    
    var viewModel: ViewModel
    
    @State private var count: Int = 0
    var body: some View {
        
        Text("Count: \(count)")
        
    }
}

class DBLogger {
    func logIntoDB() {
        
    }
}

class Logger {
    // DB
    // sending serve
    func log(_ message: String) {
        print("[LOG]: \(message)")
    }
}

protocol Networkable {
    func request()
}

extension Networkable {
    func requestId() {
        
    }
}

// Package
class Networking: Networkable {
    func request() {
        // API request
    }
}

class LoginNetworking: Networkable {
    func request() {
        
    }
    
    func requestId() {
        
    }
}
