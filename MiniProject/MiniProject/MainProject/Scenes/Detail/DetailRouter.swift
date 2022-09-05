//
//  DetailRouter.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation

protocol DetailRoutingLogic {
	func routeToSomewhere()
}

class DetailRouter: NSObject, DetailRoutingLogic {
	
	weak var viewController: DetailVC?
	
	func routeToSomewhere() {
		print("route to some vc")
	}
}
