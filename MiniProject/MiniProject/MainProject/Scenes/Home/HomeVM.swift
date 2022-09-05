//
//  HomeVM.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import UIKit
import PromiseKit

protocol HomeVMBusinessLogic {
	func getCharacters()
}

class HomeVM: HomeVMBusinessLogic {
	
	weak var viewController: HomeDisplayLogic?
	var worker = HomeWorker()
	
	func getCharacters() {
		firstly {
			worker.getCharacters()
		}.done { characters in
			self.viewController?.didGetCharacters(characters.map { $0.toCharactersCellVM() })
		}.catch { error in
			self.viewController?.didFailed(error.localizedDescription)
		}
	}
}
