//
//  Network.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import Alamofire
import HTTPStatusCodes

public typealias ResponseCompletionHandler = (_ apiResponseHandler: ApiResponseHandler, _ error: Error?) -> Void

public enum ContentType {
	case applicationJSON
	case formUrlEncoded
	
	func headers() -> [String: String] {
		switch self {
		case .applicationJSON:
			return ["Content-Type": "application/json"]
		case .formUrlEncoded:
			return ["Content-Type": "application/x-www-form-urlencoded"]
		}
	}
	
	func encoding() -> ParameterEncoding {
		switch self {
		case .applicationJSON:
			return JSONEncoding.default
		case .formUrlEncoded:
			return URLEncoding(destination: .httpBody, arrayEncoding: .noBrackets, boolEncoding: .literal)
		}
	}
}

open class APIManager {
	public static let sharedInstance = APIManager()
	private var alamofireSession: Session?
	
	public func sendRequest(contentType: ContentType = .applicationJSON,
							method: HTTPMethod,
							path: URLConvertible,
							encodingParam: ParameterEncoding? = nil,
							parameters: [String: Any]?,
							completed: @escaping ResponseCompletionHandler,
							destination: URLEncoding.Destination? = nil,
							headers:[String:String]? = nil) {
		
		var encoding: ParameterEncoding!
		var request: DataRequest!
		let updatedParams = parameters
		
		switch method {
		case .get, .delete:
			encoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
		case .put:
			if let destination = destination {
				encoding = URLEncoding(destination: destination, arrayEncoding: .noBrackets, boolEncoding: .literal)
			} else {
				encoding = contentType.encoding()
			}
		default:
			encoding = contentType.encoding()
		}
		
		if encodingParam != nil {
			encoding = encodingParam!
		}
		
		var header = headers
		if header == nil {
			header = HeaderGenerator.shared.getBasicHeader()
		}
		request = AF.request(path, method: method, encoding: JSONEncoding.default)
//		request = alamofireSession?.request(path, method: method, parameters: updatedParams, encoding: encoding, headers: HTTPHeaders(header ?? [:]))
		sendJSONRequest(request: request, completed: completed)
	}
	
	private func sendJSONRequest(request: DataRequest, completed: @escaping ResponseCompletionHandler) {
	
		request.validate(statusCode: 200..<300).responseJSON { (response) in
			switch response.result {
			case .success(let data):
				if let rsp = response.response {
					if let statusCode = HTTPStatusCode(rawValue: rsp.statusCode) {
						if statusCode.isSuccess {
							let apiResponseHandler: ApiResponseHandler = ApiResponseHandler(json: data)
							completed(apiResponseHandler, nil)
						} else {
							let apiResponseHandler: ApiResponseHandler = ApiResponseHandler(json: data)
							completed(apiResponseHandler, nil)
						}
					}
				}
			case .failure(let error):
				let apiResponseHandler: ApiResponseHandler = ApiResponseHandler(json: nil)
				completed(apiResponseHandler, error)
			}
		}
	}
}
