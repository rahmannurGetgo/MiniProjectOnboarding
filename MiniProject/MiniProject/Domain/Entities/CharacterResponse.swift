//
//  CharacterResponse.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import ObjectMapper

public class CharacterResponse: BaseResponse {
	public var results: [CharacterResults]?
	
	required public convenience init?(map: Map) {
		self.init()
	}
	
	public override func mapping(map: Map) {
		super.mapping(map: map)
		results	<- map["results"]
	}
	
	override init() {
		super.init()
	}
	
	public init(results: [CharacterResults]?) {
		super.init()
		self.results = results
	}
}

public class CharacterResults: Mappable {
	public var id: Int = 0
	public var name: String = ""
	public var status: String = ""
	public var species: String = ""
	public var type: String = ""
	public var gender: String = ""
	public var origin: Origin?
	public var location: Location?
	public var image: String = ""
	public var episode: [String] = [""]
	public var url: String = ""
	public var created: String = ""
	
	required convenience public init?(map: Map) {
		self.init()
	}
	
	public func mapping(map: Map) {
		id        	<- map["id"]
		name        <- map["name"]
		status      <- map["status"]
		species     <- map["species"]
		type        <- map["type"]
		gender		<- map["gender"]
		origin		<- map["origin"]
		location	<- map["location"]
		image		<- map["image"]
		episode		<- map["episode"]
		url			<- map["url"]
		created		<- map["created"]
	}
	
	public required init() {}
	
	public init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: Origin?, location: Location?, image: String, episode: [String], url: String, created: String) {
		self.id = id
		self.name = name
		self.status = status
		self.species = species
		self.type = type
		self.gender = gender
		self.origin = origin
		self.location = location
		self.image = image
		self.episode = episode
		self.url = url
		self.created = created
	}
	
	public func toCharactersCellVM() -> CharactersCellVM {
		return CharactersCellVM(imageUrl: image, name: name, species: species, status: status, gender: gender, location: location?.name ?? "", origin: origin?.name ?? "", episodes: episode)
	}
}

public class Origin: Mappable {
	public var name: String = ""
	public var url: String = ""
	
	required convenience public init?(map: Map) {
		self.init()
	}
	
	public func mapping(map: Map) {
		name        <- map["name"]
		url			<- map["url"]
	}
	
	public required init() {}
	
	public init(name: String, url: String) {
		self.name = name
		self.url = url
	}
}

public class Location: Mappable {
	public var name: String = ""
	public var url: String = ""
	
	required convenience public init?(map: Map) {
		self.init()
	}
	
	public func mapping(map: Map) {
		name        <- map["name"]
		url			<- map["url"]
	}
	
	public required init() {}
	
	public init(name: String, url: String) {
		self.name = name
		self.url = url
	}
}
//struct CharacterModel: Codable {
//	let id: Int?
//	let name: String?
//	let status: String?
//	let species: String?
//	let type: String?
//	let gender: String?
//	let origin: Origin?
//	let location: Location?
//	let image: String?
//	let episode: [String]?
//	let url: String?
//	let created: String?
//}
//
//struct Origin: Codable{
//	let name: String?
//	let url: String?
//}
//
//struct Location	: Codable{
//	let name: String?
//	let url: String?
//}
