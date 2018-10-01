//
//  CocktailDetailViewController.swift
//  Cocktail
//
//  Created by Luciano Schillagi on 28/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
*/

class CocktailDetailViewController: UIViewController {
	
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var selecteCocktail: Cocktail?
	var cocktailDetail = [Cocktail]()
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var cocktailImage: UIImageView!
	@IBOutlet weak var ingredientsTitle: UILabel!
	@IBOutlet weak var ingredientsText: UITextView!
	@IBOutlet weak var prepareTitle: UILabel!
	@IBOutlet weak var howToPrepare: UITextView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

    override func viewDidLoad() {
        super.viewDidLoad()

			
			
			// networking ⬇ : Cocktail Details
			CocktailApiClient.getCocktailDetails((selecteCocktail?.idDrink)!) { (success, resultCocktailDetail, error) in
				
				DispatchQueue.main.async {
					
					if success {
						// comprueba si el 'resultMedia' recibido contiene algún valor
						if let resultCocktailDetail = resultCocktailDetail {
							
							
							self.cocktailDetail = resultCocktailDetail // 🔌 👏
							//self.networkActivity.stopAnimating()
							
							
							self.navigationItem.title = self.selecteCocktail?.drinkName
								
							self.howToPrepare.text = self.selecteCocktail?.drinkInstructions
								
							debugPrint("😡\(resultCocktailDetail)")

							for item in self.cocktailDetail {
								
								let ingredients = " -\(item.drinkIngredient1!) \n -\(item.drinkIngredient2!) \n -\(item.drinkIngredient3!) \n -\(item.drinkIngredient4!) \n -\(item.drinkIngredient5!)"
								
								self.ingredientsText.text = ingredients
								self.howToPrepare.text = item.drinkInstructions
								
							}
							
							let _ = CocktailApiClient.getCocktailImage((self.selecteCocktail?.drinkThumb)!) { (imageData, error) in
								
								
								
								if let image = UIImage(data: imageData!) {
									
									DispatchQueue.main.async {

										self.cocktailImage.image = image
										
									}
								} else {
									print(error ?? "empty error")
								}
							}
							
	
						}
						
					} else {
						// si devuelve un error
						//self.displayAlertView(title: "Error Request", message: error)
					}
				}
			}
			
			
    }
    

	

}
