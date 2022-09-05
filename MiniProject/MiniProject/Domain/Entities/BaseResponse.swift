//
//  BaseResponse.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import ObjectMapper

open class BaseResponse: Mappable {
	
	public var info: [Info] = []
	
	public init() {}
	
	init(info: [Info]) {
		self.info = info
	}
	
	required convenience public init?(map: Map) {
		self.init()
	}
	
	public func mapping(map: Map) {
		info <- map["info"]
	}
}

open class Info: Mappable {
	public var count: Int = 0
	public var pages: Int = 0
	public var next: String = ""
	public var prev: String = ""
	
	required convenience public init?(map: Map) {
		self.init()
	}
	
	public func mapping(map: Map) {
		count        <- map["count"]
		pages        <- map["pages"]
		next         <- map["next"]
		prev         <- map["prev"]
	}
	
	public required init() {}
	
	public init(count: Int, pages: Int, next: String, prev: String) {
		self.count = count
		self.pages = pages
		self.next = next
		self.prev = prev
	}
}
//struct ResponseModel: Codable {
//	let info: Info?
//	let results: [CharacterModel]?
//}
//
//struct Info: Codable {
//	let count: Int?
//	let pages: Int?
//	let next: String?
//	let prev: String?
//}
