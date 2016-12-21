//
//  TodoCell.swift
//  Done
//
//  Created by LA Argon on 12/21/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit

typealias  TodoCellDidTapButtonHandler = () -> ()

class TodoCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var didTapButtonHandler: TodoCellDidTapButtonHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    private func setupView() {
        let normalImage = UIImage(named: "Normal")
        let selectedImage = UIImage(named: "Selected")
        
        button.setImage(normalImage, forState: .Normal)
        button.setImage(normalImage, forState: .Disabled)
        button.setImage(selectedImage, forState: .Selected)
        button.setImage(selectedImage, forState: .Highlighted)
        
        button.addTarget(self, action: #selector(TodoCell.didTap(_:)), forControlEvents: .TouchUpInside)
    }
    
    func didTap(sender: AnyObject) {
        if let handler = didTapButtonHandler {
            handler()
        }
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
