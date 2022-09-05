//
//  DetailWorker.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation

protocol DetailWorkerLogic {
	func getCharacterDetail() -> CharacterResults
}

class DetailWorker: DetailWorkerLogic {
	func getCharacterDetail() -> CharacterResults {
		return CharacterResults()
	}
	
}
