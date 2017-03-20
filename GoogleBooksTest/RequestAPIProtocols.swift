//
//  RequestAPIProtocols.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 15.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

enum RequestMethod: String{
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum ResponseStatus{
    case OK, ERROR
}

protocol ResponseProtocol {
    var responseStatus: ResponseStatus { get }
    func JSONBody() -> [String: AnyObject]?
    func BodyAsString() -> String?
}

protocol RequestSenderProtocol {
    var baseURL: String { get set }
    var resourcePath: String { get set }
    var method: RequestMethod { get set }
    var requestBodyString: String? { get set }
    func sendRequest(withSuccess success: @escaping (ResponseProtocol)-> Void, errorHandler: @escaping (String) -> Void) -> Void
}

protocol PathParamsRequestSenderProtocol:  RequestSenderProtocol{
    func set(_ value: String?, forPathParameter parameter: String)
    func deleteValue(for pathParameter: String)
}

