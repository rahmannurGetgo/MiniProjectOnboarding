//
//  EndPoints.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import Alamofire

public enum HomeEndpoints: URLConvertible {
	case GetCharacters
	
	var path: String {
		switch self {
		case.GetCharacters:
			return "/character"
		}
	}
	
	public func asURL() throws -> URL {
		var endpoint = ""
		switch self {
		case .GetCharacters:
			endpoint = Configuration.environment.domain + path
		}
		let url = try endpoint.asURL()
		print("character url: \(url.debugDescription)")
		return url
	}
}
