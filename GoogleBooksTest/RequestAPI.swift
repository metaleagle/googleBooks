//
//  RequestAPI.swift
//
//  Created by Andrew Danishevskyi on 19.02.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import Foundation
import UIKit


struct URLResponse: ResponseProtocol {
    internal func JSONBody() -> [String : AnyObject]? {
        var json: [String: AnyObject]!
        do {
            json = try JSONSerialization.jsonObject(with: self.dataBytes!, options: []) as! [String: AnyObject]
        } catch {
            return nil
        }
        return json
    }

    internal var responseStatus: ResponseStatus

    var dataBytes: Data?
    
    func BodyAsString() -> String? {
        if let bytes = self.dataBytes{
            if let bodyAsString = String(bytes: bytes, encoding: .utf8){
                return bodyAsString
            }
        }
        return nil
    }
}

class RequestSender: NSObject, URLSessionDelegate, RequestSenderProtocol{

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var baseURL: String
    var resourcePath: String
    var method: RequestMethod
    var requestBodyString: String?
    
    init(baseURL: String, resourcePath: String, method: RequestMethod, requestBodyString: String?) {
        self.baseURL = baseURL
        self.resourcePath = resourcePath
        self.method = method
        self.requestBodyString = requestBodyString
        super.init()
    }
    
    deinit {
        if dataTask != nil {
            dataTask?.cancel()
        }
    }
    
    func sendRequest(withSuccess success: @escaping (ResponseProtocol) -> Void, errorHandler: @escaping (String) -> Void) {
        if dataTask != nil && dataTask?.state == .running{
            #if DEBUG
                print("Canceling request to \(dataTask?.currentRequest?.url)")
            #endif
            dataTask?.cancel()
        }
        
        let urlString = "\(self.baseURL)/\(self.resourcePath)"
        guard let requestURL = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = self.method.rawValue
        request.httpBody = (nil != self.requestBodyString) ? self.requestBodyString!.data(using: .utf8) : nil
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let httpResponse = response as? HTTPURLResponse{
                if let error = error {
                    errorHandler(error.localizedDescription)
                } else {
                    var responseStatus: ResponseStatus
                    switch httpResponse.statusCode{
                    case (200..<400):
                        responseStatus = .OK
                    default:
                        responseStatus = .ERROR
                    }
                    let response = URLResponse(responseStatus:responseStatus, dataBytes:data)
                    #if DEBUG
                        print("Response received from \(httpResponse.url?.absoluteString)")
                        print("with body: \n \(response.BodyAsString())")
                    #endif
                    success(response)
                }
                
            }
        })
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        #if DEBUG
            print("Sending \(self.method.rawValue) request to \(self.baseURL)\\\(self.resourcePath)")
            if nil != self.requestBodyString{
                print("Request body: \(self.requestBodyString)")
            }
        #endif
        dataTask?.resume()
    }
}

class PathParamsRequestSender: RequestSender, PathParamsRequestSenderProtocol{
    private lazy var pathParameters: Dictionary<String, String> = {
        return Dictionary<String, String>()
    }()
    
    func set(_ value: String?, forPathParameter parameter: String){
        self.pathParameters[parameter] = value
    }
    
    func deleteValue(for pathParameter: String){
        self.set(nil, forPathParameter: pathParameter)
    }
    
    override var resourcePath: String{
        get{
                if !pathParameters.isEmpty{
                    let resourcePathWithParams = pathParameters.reduce(super.resourcePath + "?", {resPath, parameter in
                        resPath + "\(parameter.key)=\(parameter.value), "
                    })
                    return String(resourcePathWithParams.characters.dropLast(2))
                }
            return super.resourcePath
        }
        set{
            super.resourcePath = newValue
        }
    }
}

class GoogleBooksAPI: PathParamsRequestSender {
    init() {
        super.init(baseURL: "https://www.googleapis.com", resourcePath: "books/v1/volumes", method: .GET, requestBodyString: nil)
    }
}
