//
//  OtherViewController.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-08.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

	@IBOutlet weak var weatherIcon: UIImageView!
	@IBOutlet weak var weatherLabel: UILabel!
	
	var weatherData: WeatherData!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.weatherLabel.text = "hej: \(weatherData.latitude)"
    }
	
}
