//
//  ExampleTableViewCell.swift
//  iOS7SwiftCore
//
//  Created by MacMini on 9/30/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewAvatar: UIImageView!
    @IBOutlet weak var buttonOK: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: AccountModel){
        let controls = [labelTitle, imageViewAvatar, buttonOK]
        let values   = [model.email, "lock-icon", model.gender]
        
        self .setValueForBasicControl(controls, values: values)
    }
}
