//
//  UIImageView.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
	func setImage(with urlString: String) {
		guard let url = URL(string: urlString) else { return }
		kf.setImage(with: url, options: [
								.transition(ImageTransition.fade(0.0)),
								.forceTransition,
								.keepCurrentImageWhileLoading
							]
		)
	}
}
