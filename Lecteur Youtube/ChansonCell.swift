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

     // Comment/Quel cellule doit-on peupler
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
        
        
        // IMPORTANT A COMPRENDRE
        
        if let url = URL(string: self.chanson.miniatureUrl)  {  //si existe
            let session = URLSession.shared // ouvre une session "shared est type d'accesseur"
            let task = session.dataTask(with: url) { (data, response, error) in //reponse des requete ____ ce qui nous amene dans un traitment " arriere plan / background / de fond".
                if let imageData = data, let image = UIImage(data: imageData) { //on s'occupe que du data et non pas du response ni d'error
                    DispatchQueue.main.async { // dispatchqueu est queu principal. main=principal.asyun=asyunchrone
                        self.miniature.image = image
                    }
                }
            }
            task.resume() // on revient sur notre tache principal "main"
        }
    }
    
    
// Attention de bien configurer la "Info.plist" concernant le telechargement http/https(sécurisé)
    
    
}






