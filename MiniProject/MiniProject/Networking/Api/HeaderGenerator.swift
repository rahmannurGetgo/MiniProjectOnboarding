//
//  HeaderGenerator.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation

public class HeaderGenerator {
	
	public static let shared: HeaderGenerator = HeaderGenerator()
	
	public func getBasicHeader() -> [String: String] {
		return ["Authorization": "Basic"]
	}
	
	public func getBasicHeaderCartrackFleet() -> [String: String] {
		return["Authorization": "Basic"]
	}
}
