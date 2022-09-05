//
//  Configuration.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation

public var env: Constants.Environment = .production
public var cartrackDomain: Constants.CartrackFleetEnvironment = .primary

public struct Configuration {
	public static let environment: Constants.Environment = {
		return env
	}()
	
	public static let cartrackEnvironment: Constants.CartrackFleetEnvironment = {
		return cartrackDomain
	}()
	
	public static let oneMapDomain = "https://developers.onemap.sg"
}

public struct Constants {
	
	public enum Environment: String {
		case development
		case production
		case uat
		
		public var domain: String {
			switch self {
			case .development: return "https://rickandmortyapi.com/api"
			case .uat        : return "https://rickandmortyapi.com/api"
			case .production : return "https://rickandmortyapi.com/api"
			}
		}
		
		public var path: String {
			return ""
		}
		
		public var version: String {
			switch self {
			case .development: return "/v1"
			case .production : return "/v1"
			case .uat        : return "/v1"
			}
		}
		
		public var name: String {
			switch self {
			case .development: return "Staging"
			case .uat        : return "UAT"
			case .production : return "Production"
			}
		}
	}
	
	public enum CartrackFleetEnvironment: String {
		case primary
		case secondary
		
		public var domain: String {
			switch self {
			case .primary: return "https://getgo-api.cartrack.com"
			case .secondary: return "https://getgo-api-secondary.cartrack.com"
			}
		}
		
		public var service: String {
			switch self {
			case .primary:
				return "/rest"
			case .secondary:
				return "/rest"
			}
		}
	}
	
	struct APIVersion {
		static let v1 = "/v1"
		static let v1_1 = "/v1.1"
		static let v2 = "/v2"
	}
   
}
