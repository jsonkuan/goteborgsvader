//
//  Converter.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-09.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation


struct Converter {
	
	func fahrenheitToCelcius(temp: Double) -> Double {
		return ( (temp - 32) * (5/9) )
	}
}
