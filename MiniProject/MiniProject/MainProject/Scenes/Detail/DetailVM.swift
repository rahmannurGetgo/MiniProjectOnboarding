//
//  DetailVM.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import UIKit

protocol DetailVMBusinessLogic {
	func getCleanEpisodeNumbers(_ character: CharactersCellVM, _ index: Int) -> String?
}

class DetailVM: DetailVMBusinessLogic {
	
	weak var viewController: DetailVC?
	var worker = DetailWorker()
	
	func getCleanEpisodeNumbers(_ character: CharactersCellVM, _ index: Int)  -> String? {
		let episode = character.episodes[index]
		let episodeNumber = episode.split(separator: "/").last.map(String.init)
		return episodeNumber
	}
	
}
