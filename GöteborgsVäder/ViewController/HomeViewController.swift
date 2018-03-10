//
//  HomeViewController.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-08.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	@IBOutlet weak var weatherIcon: UIImageView!
	@IBOutlet weak var weatherLabel: UILabel!
	@IBOutlet weak var temperatureLabel: UILabel!
	@IBOutlet weak var chanceOfRainLabel: UILabel!
	@IBOutlet weak var drinkButton: UIButton!
	@IBOutlet weak var cityRegionPickerView: UIPickerView!
	
	let networkHandler = NetworkHandler()
	var weatherData: WeatherData?
	let cityRegions = CityRegion()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		cityRegionPickerView.delegate = self
		cityRegionPickerView.dataSource = self
		
		networkHandler.getWeatherData(lat: cityRegions.allRegions[0].latitude, long: cityRegions.allRegions[0].longitude) { data in

			self.weatherData = data
			self.weatherLabel.text = data.currently.summary
			
			let converter = Converter()
			let celcius = converter.fahrenheitToCelcius(temp: data.currently.temperature)
			self.temperatureLabel.text = String("\(Int(celcius)) ºC")
			
			let precipitation = data.currently.precipProbability
			self.chanceOfRainLabel.text = String("🌧 \(Int(precipitation * 100))% ")
			
			print(data.currently.icon)
			self.setIcon(icon: data.currently.icon)
		}
	}
	
	// MARK: - UIPickerView
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return cityRegions.allRegions.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return cityRegions.allRegions[row].name
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.navigationItem.title = cityRegions.allRegions[row].name
		
		networkHandler.getWeatherData(lat: cityRegions.allRegions[row].latitude, long: cityRegions.allRegions[row].longitude) { data in
			self.weatherData = data
			self.weatherLabel.text = data.currently.summary
			
			let converter = Converter()
			let celcius = converter.fahrenheitToCelcius(temp: data.currently.temperature)
			self.temperatureLabel.text = String("\(Int(celcius)) ºC")
			
			let precipitation = data.currently.precipProbability
			self.chanceOfRainLabel.text = String("🌧 \(Int(precipitation * 100))% ")
			
			print(data.currently.icon)
			self.setIcon(icon: data.currently.icon)
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		var label = UILabel()
		if let v = view as? UILabel { label = v }
		label.font = UIFont (name: "Copperplate", size: 20)
		label.text =  cityRegions.allRegions[row].name
		label.textAlignment = .center
		label.textColor = .white
		return label
	}
	
	// MARK: - Private helper methods
	
	private func setIcon(icon: String) {
		switch icon {
		case "snow", "sleet":
			weatherIcon.image = #imageLiteral(resourceName: "snow")
		case "rain":
			weatherIcon.image = #imageLiteral(resourceName: "rain")
			self.drinkButton.isHidden = false
		case "cloudy":
			weatherIcon.image = #imageLiteral(resourceName: "cloudy")
		case "partly-cloudy-day":
			weatherIcon.image = #imageLiteral(resourceName: "partly cloudy day")
		case "partly-cloudy-night":
			weatherIcon.image = #imageLiteral(resourceName: "partly cloudy night")
		case "wind":
			weatherIcon.image = #imageLiteral(resourceName: "windy")
		case "fog":
			weatherIcon.image = #imageLiteral(resourceName: "foggy")
		case "clear-day":
			weatherIcon.image = #imageLiteral(resourceName: "sunny")
		case "clear-night":
			weatherIcon.image = #imageLiteral(resourceName: "clear night")
		default:
			weatherIcon.image = #imageLiteral(resourceName: "rain_icon")
			self.drinkButton.isHidden = true
		}
	}

	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	
		let destination = segue.destination as! OtherViewController
		destination.weatherData = self.weatherData
	}

}

