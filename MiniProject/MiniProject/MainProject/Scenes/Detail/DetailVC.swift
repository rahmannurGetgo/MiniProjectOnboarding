//
//  DetailVC.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import Foundation
import UIKit

protocol DetailDisplayLogic: AnyObject {
	func listOfEpisodes(episodes: String)
	func showOnFailed(errorMsg: String)
}

class DetailVC: UIViewController {
	
	@IBOutlet weak var characterImgView: UIImageView!
	@IBOutlet weak var genderTitleLbl: UILabel!
	@IBOutlet weak var genderLbl: UILabel!
	@IBOutlet weak var locationTitleLbl: UILabel!
	@IBOutlet weak var locationLbl: UILabel!
	@IBOutlet weak var originTitleLbl: UILabel!
	@IBOutlet weak var originLbl: UILabel!
	@IBOutlet weak var listOfEpTitleLbl: UILabel!
	@IBOutlet weak var episodesTableView: UITableView!
	
	var router: (NSObjectProtocol & DetailRoutingLogic)?
	var vm: DetailVM?
	var characterDetailData: CharactersCellVM?
	var listOfEps: [String] = [""]
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	// MARK: Setup
	private func setup() {
		let viewController = self
		let router = DetailRouter()
		let vm = DetailVM()
		viewController.router = router
		viewController.vm = vm
		router.viewController = viewController
		vm.viewController = viewController
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	private func setupView() {
		episodesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
		episodesTableView.delegate = self
		episodesTableView.dataSource = self
		
		guard let data = characterDetailData else {
			return
		}
		navigationItem.title = data.name
		navigationItem.largeTitleDisplayMode = .never
		characterImgView.setImage(with: data.imageUrl)
		genderLbl.text = data.gender
		locationLbl.text = data.location
		originLbl.text = data.origin
	}
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return characterDetailData?.episodes.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
		if let data = characterDetailData {
			cell.textLabel?.text = "Episode " + (vm?.getCleanEpisodeNumbers(data, indexPath.row) ?? "")
		}
		
		return cell
	}
	
	
}

extension DetailVC: DetailDisplayLogic {
	func listOfEpisodes(episodes: String) {
		//
	}
	
	func showOnFailed(errorMsg: String) {
		//
	}
	
	
}
