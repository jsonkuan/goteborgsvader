//
//  HomeViewController.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-08.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var weatherIcon: UIImageView!
	@IBOutlet weak var weatherLabel: UILabel!
	
	let handler = NetworkHandler()
	var weatherData: WeatherData?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		handler.getWeatherData(lat: 57.7089, long: 11.9746) { data in
			self.weatherLabel.text = data.currently.summary
			self.weatherData = data
			
			print(data.currently.icon)
			self.setIcon(icon: data.currently.icon)
		}
	}
	
	private func setIcon(icon: String) {
		switch icon {
		case "snow", "sleet":
			weatherIcon.image = #imageLiteral(resourceName: "Snow")
		case "rain":
			weatherIcon.image = #imageLiteral(resourceName: "rain")
		default:
			weatherIcon.image = #imageLiteral(resourceName: "rain")
			/* Additional cases to handle:
			 	"wind", "fog", "cloudy", "clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night"
			*/
		}
	}

}

