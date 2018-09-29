//
//  Cocktail.swift
//  Cocktail
//
//  Created by Luciano Schillagi on 29/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:

*/

struct Cocktail {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	let drinkName: String? // 'strDrink'
	let drinkThumb: String? // 'strDrinkThumb'
	let idDrink: String? // 'idDrink'


	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// construye el objeto 'Cocktail' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
		drinkName = dictionary["strDrink"] as? String
		drinkThumb = dictionary["strDrinkThumb"] as? String
		idDrink = dictionary["idDrink"] as? String
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	static func drinkFromResults(_ drinkResults: [[String:AnyObject]]) -> [Cocktail] {
		
		var drinkArray = [Cocktail]()
		
		// itera a través del array de diccionarios, cada ´Cocktail´ es un diccionario
		for result in drinkResults {
			drinkArray.append(Cocktail(dictionary: result))
		}
		
		return drinkArray
	}
	
} // end class
