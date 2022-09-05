//
//  HomeManager.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import Alamofire

public class HomeManager: HomeManagerProtocol {
	
	public static let shared = HomeManager()
	
	public func getHomeCharacters(_ completion: @escaping ResponseCompletionHandler) {
		APIManager.sharedInstance.sendRequest(method: .get, path: HomeEndpoints.GetCharacters, parameters: nil, completed: completion)
	}
}
