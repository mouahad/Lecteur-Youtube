//
//  ChansonCell.swift
//  Lecteur Youtube
//
//  Created by MYD on 25/05/2018.
//  Copyright © 2018 MYD. All rights reserved.
//

import UIKit

class ChansonCell: UITableViewCell {

    @IBOutlet weak var miniature: UIImageView!
    @IBOutlet weak var artisteEtTitreLabel: UILabel!
    
    var chanson: Chanson!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func creerCell(_ chanson: Chanson) {
        self.chanson = chanson
        telechachargerImage()
        let attributed = NSMutableAttributedString(string: self.chanson.titre, attributes: [.font:UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.black])
        let secondeLigne = NSMutableAttributedString(string: "\n"+self.chanson.artiste, attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.darkGray])
        attributed.append(secondeLigne)
        artisteEtTitreLabel.attributedText = attributed
        
    }
    
    
    func telechachargerImage(){
        miniature.image = #imageLiteral(resourceName: "logo")
        
        if let url = URL(string: self.chanson.miniatureUrl) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.miniature.image = image
                    }
                }
            }
            task.resume()
        }
    }
    
    
}






