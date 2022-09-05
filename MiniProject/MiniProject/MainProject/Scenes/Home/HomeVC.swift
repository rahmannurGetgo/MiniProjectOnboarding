//
//  HomeVC.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import UIKit

protocol HomeDisplayLogic: AnyObject {
	func didGetCharacters(_ characters: [CharactersCellVM])
	func didFailed(_ error: String)
}

class HomeVC: UIViewController {
	
	@IBOutlet weak var characterTableView: UITableView!
	
	var router: (NSObjectProtocol & HomeRoutingLogic)?
	var vm: HomeVM?
	var characters: [CharactersCellVM] = []
	// MARK: Object lifecycle
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	// MARK: Setup
	private func setup() {
		let viewController = self
		let router = HomeRouter()
		let vm = HomeVM()
		viewController.router = router
		viewController.vm = vm
		router.viewController = viewController
		vm.viewController = viewController
	}
	
	// MARK: View Lifecycles And View Setups
	func setupView() {
		characterTableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "cell")
		characterTableView.delegate = self
		characterTableView.dataSource = self
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		vm?.getCharacters()
	}
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return characters.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharacterCell {
			cell.character = characters[indexPath.row]
			return cell
		} else {
			return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		router?.routeToDetail(character: self.characters[indexPath.row])
	}
}

extension HomeVC: HomeDisplayLogic {
	func didGetCharacters(_ characters: [CharactersCellVM]) {
		self.characters.append(contentsOf: characters)
		characterTableView.reloadData()
	}
	
	func didFailed(_ error: String) {
		print(error)
	}
	
	
}
