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
    
    let identifiantCell = "ChansonCell"
    let identifiantSegue = "VersVideo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ajouterChanson()
        navigationController?.title = "Mes videos préférées"
    }
// Nombre de ligne -> numberOfRows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }
// Comment/Quel cellule doit-on peupler -> cellForRow
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chanson = chansons[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifiantCell) as? ChansonCell {
            cell.creerCell(chanson)
            return cell
        }
        
        return UITableViewCell()
    }
// Réglage de l'espace entre -> les cellules heightForRow
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    } 
//La ligne selectionner -> didselectRow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chanon = chansons[indexPath.row]
        performSegue(withIdentifier: identifiantSegue, sender: chanon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifiantSegue {
            if let nouveauController = segue.destination as? VideoController {
                nouveauController.chanson = sender as? Chanson
            }
            
        }
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
