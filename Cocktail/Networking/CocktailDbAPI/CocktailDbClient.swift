//
//  CocktailDbClient.swift
//  Cocktail
//
//  Created by Luciano Schillagi on 28/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation
import Alamofire

/* Abstract
*/

/*
1. Cocktails list:

For each row of the list it will display the Cocktail name and photo (See wireframe 1). The API endpoint that should be consumed for this purpose is:

http://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass

This returns a JSON list of cocktails, and the information needed in order to populate each row of the list.

{
strDrink,           → Cocktail name
strDrinkThumb,  → Photo URL
idDrink       → Cocktail ID
}


2. Cocktail detail:

Once the user taps on a row from the list mentioned in the previous feature it will push a new screen with the selected cocktail’s details, where it will show it’s name, photo, ingredients and instructions (See wireframe 2)

The endpoint to be used for this is the following:

http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=${idDrink} → Cocktail ID I.g.: http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=16108

The endpoint returns a JSON with the cocktails info, the needed properties are:

{
strInstructions,  → instructions
strDrink,         → cocktail name
strDrinkThumb,    → photo URL
strIngredient1,   → ingredient 1
...
strIngredientN    → ingredient N
}

*/

class CocktailApiClient: NSObject {
	
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init() { super.init() }
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// shared session
	var session = URLSession.shared
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
	
	// MARK: Get Media for Search
	static func getCocktails(completionHandlerForGetCocktails: @escaping (_ success: Bool, _ result: [Cocktail]?, _ error: String?) -> Void)  {
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request("http://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass").responseJSON { response in
			
			debugPrint("🎬\(response)")
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForGetCocktails(false, nil, errorMessage)
				}
			}
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
			if let jsonObjectResult: Any = response.result.value {
				
				debugPrint("☠️jsonObjectResult")
				
				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
				
				debugPrint("🤜JSON COCKTAILS: \(jsonObjectResult)") // JSON obtenido
				
				if let results = jsonObjectResultDictionary["drinks"] {
					
					let resultsCocktails = Cocktail.drinkFromResults(results as! [[String : AnyObject]])
					
					//test
					debugPrint("🤾🏼‍♂️ Cocktails...\(resultsCocktails)")
					
					completionHandlerForGetCocktails(true, resultsCocktails, nil)
					
				}
			}
		}
	}
	
	
}
