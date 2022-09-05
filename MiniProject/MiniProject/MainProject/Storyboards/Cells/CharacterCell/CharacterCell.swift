//
//  CharacterCell.swift
//  MiniProject
//
//  Created by Rahmannur Rizki Syahputra on 05/09/22.
//

import UIKit

class CharacterCell: UITableViewCell {

	@IBOutlet weak var characterNameLbl: UILabel!
	@IBOutlet weak var characterSpeciesLbl: UILabel!
	@IBOutlet weak var characterStatusLbl: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	var character: CharactersCellVM! {
		didSet {
			characterNameLbl.text = character.name
			characterSpeciesLbl.text = character.species
			characterStatusLbl.text = character.status
		}
	}
	
}
