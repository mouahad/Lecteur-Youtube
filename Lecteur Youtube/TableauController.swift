//
//  TableauController.swift
//  Lecteur Youtube
//
//  Created by MYD on 25/05/2018.
//  Copyright © 2018 MYD. All rights reserved.
//

import UIKit

class TableauController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chansons = [Chanson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ajouterChanson()
    }
//Nombre de ligne
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }
 //Quel cellule doit-on peupler
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func ajouterChanson() {
        chansons = [Chanson]()
        let passe = Chanson(artiste: "Titope", titre: "30 Magnifiques Passes", code: "nR4rBu8nXaY")
        chansons.append(passe)
        let dribble = Chanson(artiste: "Titope", titre: "30 Dribblers", code: "dmTFN2Bm2Xc")
        chansons.append(dribble)
        let geste = Chanson(artiste: "Titope", titre: "30 GESTES Incroyables", code: "pdq6xoHu-kk")
        chansons.append(geste)
        let but = Chanson(artiste: "Titope", titre: "Les plus Beaux Buts de la Saison 2017/18", code: "97Fcy1s9Ax0")
        chansons.append(but)
        
        //ReloadDATA
        
        tableView.reloadData()
        
    }
    
}
