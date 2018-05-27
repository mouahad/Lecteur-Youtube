//
//  VideoController.swift
//  Lecteur Youtube
//
//  Created by MYD on 27/05/2018.
//  Copyright © 2018 MYD. All rights reserved.
//

import UIKit

class VideoController: UIViewController {

    var chanson: Chanson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        if chanson != nil {
            title = chanson?.titre
        }
    }

  

}
