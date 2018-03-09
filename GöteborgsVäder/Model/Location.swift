//
//  Location.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-09.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

struct City {
	
	let name: String
	let latitude: Double
	let longitude: Double
	
	init(name: String, latitude: Double, longitude: Double) {
		self.name = name
		self.latitude = latitude
		self.longitude = longitude
	}
	
}
