//
//  ApiResponseHandler.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import SwiftyJSON

public struct ApiResponseHandler {
	
	public var jsonObject: Any?
	public var data: Any?
	
	// Server Error Handling
	public var server_error_code: Int?
	public var server_error_message: String?
	
	// Business Error Handling
	public var error_message: String?
	public var error_code: Int?
	
	// Token
	public var access_Token: String?
	public var refresh_Token: String?
	
	
	public init(json: Any?) {
		if let js = json {
			self.jsonObject = js
			
			let json = JSON(js)
			self.data = json["data"]
			
			self.error_code = json["data"]["data_error_code"].int
			self.error_message = json["data"]["data_error_msg"].string
			self.server_error_code = json["error_code"].int
			self.server_error_message = json["error_msg"].string
			
			self.access_Token = json["data"]["accessToken"].string
			self.refresh_Token = json["data"]["refreshToken"].string
		}
	}
	
	public func isSuccess() -> Bool {
		if let serverErrorCode = server_error_code {
			return serverErrorCode == 0
		}
		
		return false
	}
	
	public func isTokenExpired() -> Bool {
		if let code = server_error_code {
			if code == 401 || code == 498 || code == 400 {
				return true
			}
		}
		
		return false
	}
	
	public func isNewUser() -> Bool {
		if let code = server_error_code {
			if code == 999 {
				return true
			}
		}
		
		return false
	}
	
	public func errorMessage() -> String {
		return dataErrorMessage() ?? serverErrorMessage()
	}
	
	public func dataErrorMessage() -> String? {
		return error_message
	}
	
	public func serverErrorMessage() -> String {
		guard let msg = server_error_message else {
			return Messages.ErrorMessages.serverError
		}
		return msg
	}
}
