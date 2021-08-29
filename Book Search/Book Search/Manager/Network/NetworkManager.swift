//
//  NetworkManager.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import Foundation


enum NetworkManagerResponse {
    case success(Data?)
    case failure(Error)
}


/// Base class to make request's.
struct NetworkManager {
    
    enum NetworkHttpMethod: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    
    /// Creates a request to the desired URL. When completed, will return a NetworkManagerResponse with success or failure.
    /// - parameter url: url to be called.
    /// - parameter method: the desired HTTP Method.
    /// - parameter onComplete: completion block with the response
    func request(url: URL, method: NetworkHttpMethod = .get, onComplete: @escaping (_ result: NetworkManagerResponse) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        logRequest(request)
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            self.logResponse(data: data, response: urlResponse as? HTTPURLResponse, error: error)
            
            DispatchQueue.main.async {
                if let error = error {
                    onComplete(.failure(error))
                } else {
                    onComplete(.success(data))
                }
            }
        }.resume()

    }
    
    
    private func logRequest(_ request: URLRequest) {
        #if DEBUG
        let urlString = request.url?.absoluteString ?? ""
        let components = NSURLComponents(string: urlString)

        let method = request.httpMethod != nil ? "\(request.httpMethod!)": ""
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        let host = "\(components?.host ?? "")"

        var requestLog = "\n---------- OUT ---------->\n"
        requestLog += "\(urlString)"
        requestLog += "\n\n"
        requestLog += "\(method) \(path)?\(query) HTTP/1.1\n"
        requestLog += "Host: \(host)\n"
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            requestLog += "\(key): \(value)\n"
        }
        if let body = request.httpBody{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded";
            requestLog += "\n\(bodyString)\n"
        }

        requestLog += "\n------------------------->\n";
        Log.network(requestLog)
        #endif
    }
    
    
    private func logResponse(data: Data?, response: HTTPURLResponse?, error: Error?) {
        #if DEBUG
        let urlString = response?.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")

        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"

        var responseLog = "\n<---------- IN ----------\n"
        if let urlString = urlString {
            responseLog += "\(urlString)"
            responseLog += "\n\n"
        }

        if let statusCode =  response?.statusCode{
            responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
        }
        if let host = components?.host{
            responseLog += "Host: \(host)\n"
        }
        for (key,value) in response?.allHeaderFields ?? [:] {
            responseLog += "\(key): \(value)\n"
        }
        if let body = data{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded";
            responseLog += "\n\(bodyString)\n"
        }
        if let error = error{
            responseLog += "\nError: \(error.localizedDescription)\n"
        }

        responseLog += "<------------------------\n";
        Log.network(responseLog)
        #endif
    }
    
}
