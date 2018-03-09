//
//  NetworkHandler.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-08.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkHandler {
	
	let decoder = JSONDecoder()
	
	func getWeatherData(lat: Double, long: Double, completion: @escaping (_ WeatherData: WeatherData) -> Void) {
		
		let url = "\(BASEURL)\(APIKEY)/\(lat),\(long)"
		
		Alamofire.request(url).responseJSON { response in
			if let data = response.data {
				do {
					let weather = try self.decoder.decode(WeatherData.self, from: data)
					completion(weather)
				} catch let error {
					fatalError("Failed getting weather data: \(error)")
				}
			}
		}
	}
}
