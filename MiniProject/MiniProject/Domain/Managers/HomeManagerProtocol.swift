//
//  HomeManager.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation

public protocol HomeManagerProtocol {
	func getHomeCharacters(_ completion: @escaping ResponseCompletionHandler)
}
