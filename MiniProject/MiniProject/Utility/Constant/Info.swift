//
//  Info.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation

public struct Messages {
	// Error mesages for worker
	public struct ErrorMessages {
		public static let serverError = "Something went wrong. Please wait for a few minutes before you try again."
		public static let internetError = "You're offline! Check your connection and try again."
		public static let realmError = "Unable to establish a connection. Please restart the app and try again"
		public static let parseError = "Something went wrong. Please wait for a few minutes before you try again."
	}
	// Error messages for phone number validation
	public struct ValidationMessages {
		public static let wrongPhoneNumber = "Oops! Please enter a valid phone number."
	}
}
