//
//  VideoController.swift
//  Lecteur Youtube
//
//  Created by MYD on 27/05/2018.
//  Copyright © 2018 MYD. All rights reserved.
//

import UIKit
import WebKit

class VideoController: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    
    
    var chanson: Chanson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if chanson != nil {
            //title = chanson?.titre
            chargerVideo(chanson: chanson!)
        }
    }

    func chargerVideo(chanson: Chanson) {
        if let url = URL(string: chanson.videoUrl) {
            let requete = URLRequest(url: url)
            WebView.load(requete)
            
        }
    }

}
