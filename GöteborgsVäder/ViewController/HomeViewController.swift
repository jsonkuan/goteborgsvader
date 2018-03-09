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
	@IBOutlet weak var temperatureLabel: UILabel!
	@IBOutlet weak var chanceOfRainLabel: UILabel!
	
	let networkHandler = NetworkHandler()
	var weatherData: WeatherData?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let majorna = Location.init(name: "Majorna", latitude: 59.6918, longitude: 11.9253)
		let mölndal = Location.init(name: "mölndal", latitude: 57.6552, longitude: 12.0166)
		
		networkHandler.getWeatherData(lat: majorna.latitude, long: majorna.longitude) { data in
			self.weatherLabel.text = majorna.name
			self.weatherData = data
			
			let converter = Converter()
			let celcius = converter.fahrenheitToCelcius(temp: data.currently.temperature)
			self.temperatureLabel.text = String("\(Int(celcius)) ºC")
			
			let precipitation = data.currently.precipProbability
			self.chanceOfRainLabel.text = String("🌧 \(Int(precipitation * 100))% ")
			
			print(data.currently.icon)
			self.setIcon(icon: data.currently.icon)
		}
	}
	
	// MARK: - Private helper methods
	
	private func setIcon(icon: String) {
		switch icon {
		case "snow", "sleet":
			weatherIcon.image = #imageLiteral(resourceName: "snow")
		case "rain":
			weatherIcon.image = #imageLiteral(resourceName: "rain")
		case "cloudy":
			weatherIcon.image = #imageLiteral(resourceName: "cloudy")
		case "partly-cloudy-day":
			weatherIcon.image = #imageLiteral(resourceName: "partly_cloudy_day")
		case "partly-cloudy-night":
			weatherIcon.image = #imageLiteral(resourceName: "partly_cloudy_night")
		case "wind":
			weatherIcon.image = #imageLiteral(resourceName: "windy")
		case "fog":
			weatherIcon.image = #imageLiteral(resourceName: "foggy")
		case "clear-day":
			weatherIcon.image = #imageLiteral(resourceName: "sunny")
		case "clear-night":
			weatherIcon.image = #imageLiteral(resourceName: "clear_night")
		default:
			weatherIcon.image = #imageLiteral(resourceName: "rain_icon")
		}
	}

	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	
		let destination = segue.destination as! OtherViewController
		destination.weatherData = self.weatherData
	}

}

