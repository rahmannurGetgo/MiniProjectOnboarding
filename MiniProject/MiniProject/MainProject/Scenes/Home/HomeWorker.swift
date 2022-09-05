//
//  HomeWorker.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import PromiseKit
import ObjectMapper

protocol HomeWorkerLogic {
	func getCharacters() -> Promise<([CharacterResults])>
}

class HomeWorker: HomeWorkerLogic {
	func getCharacters() -> Promise<([CharacterResults])> {
		return Promise { seal in
			HomeManager.shared.getHomeCharacters { (apiResponse, error) in
				if let response = Mapper<CharacterResponse>().map(JSONObject: apiResponse.jsonObject) {
					if let results = response.results {
						let charactersData = results
						seal.fulfill(charactersData)
					} else {
						seal.reject(error!)
					}
				}
			}
		}
	}
	
}
