//
//  HomeRouter.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import UIKit

protocol HomeRoutingLogic {
	func routeToDetail(character: CharactersCellVM)
}

class HomeRouter: NSObject, HomeRoutingLogic {
	
	weak var viewController: HomeVC?
	
	func routeToDetail(character: CharactersCellVM) {
		let storyboard = UIStoryboard(name: "Detail", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "characterDetailVC") as! DetailVC
		vc.characterDetailData = character
		viewController?.navigationController?.pushViewController(vc, animated: true)
	}
}
