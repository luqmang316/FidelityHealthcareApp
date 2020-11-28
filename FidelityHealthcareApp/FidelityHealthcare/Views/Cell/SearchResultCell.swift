//
//  SearchResultCell.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

class SearchResultCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var synopsisLbl: UILabel!
    
    public var viewModel: SearchBusinessCellViewModel!{
        
        didSet{
            
            self.setData()
        }
    }
    
    // MARK: - set UI
    private func setData(){
        
        imageIcon.image = UIImage(named: "placeholder")
        imageIcon.downloadImage(viewModel.imageURL)
        titleLbl.text = viewModel.title
        typeLbl.text = viewModel.type
        synopsisLbl.text = viewModel.synopsis
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
