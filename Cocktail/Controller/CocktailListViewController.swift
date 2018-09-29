//
//  CocktailListViewController.swift
//  Cocktail
//
//  Created by Luciano Schillagi on 28/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
Una pantalla que contiene un listado de cocktails. Cada celda contiene el nombre, los ingredientes y la foto del trago.
*/

class CocktailListViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var cocktail: Cocktail?
	var cocktailArray = [Cocktail]()
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	// la lista de tragos
	@IBOutlet weak var cocktailTableView: UITableView!
	
	
	
	
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		//TODO: luego mudar

			// networking ⬇ : Cocktails
			CocktailApiClient.getCocktails { (success, resultCocktail, error) in
				
				DispatchQueue.main.async {
					
					if success {
						// comprueba si el 'resultMedia' recibido contiene algún valor
						if let resultCocktail = resultCocktail {
							
							self.cocktailArray = resultCocktail // 🔌 👏
							//self.stopActivityIndicator()
							//self.mediaTableView.reloadData()
						}
						
					} else {
						// si devuelve un error
						//self.displayAlertView(title: "Error Request", message: error)
					}
				}
			}
		}
	
	
	
	
	
	
		
	
	} // end class





