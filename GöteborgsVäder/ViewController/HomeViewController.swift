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
	
	let majorna = Location.init(name: "Majorna", latitude: 59.6918, longitude: 11.9253)
	let mölndal = Location.init(name: "Mölndal", latitude: 57.6552, longitude: 12.0166)
	let hissingen = Location.init(name: "Hissingen", latitude: 57.6552, longitude: 12.0166)
	let kåltorp = Location.init(name: "Kåltorp", latitude: 57.6552, longitude: 12.0166)
	let linne = Location.init(name: "Linne", latitude: 57.6552, longitude: 12.0166)
	
	var cityAreas: [Location]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		cityAreas = [majorna, mölndal, hissingen, kåltorp, linne]
		
		cityRegionPickerView.delegate = self
		cityRegionPickerView.dataSource = self
		
		networkHandler.getWeatherData(lat: majorna.latitude, long: majorna.longitude) { data in

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
		return cityAreas.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return cityAreas[row].name
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.navigationItem.title = cityAreas[row].name
	}
	
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		var label = UILabel()
		if let v = view as? UILabel { label = v }
		label.font = UIFont (name: "Copperplate", size: 20)
		label.text =  cityAreas[row].name
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
			self.drinkButton.isHidden = false
			weatherIcon.image = #imageLiteral(resourceName: "rain")
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

