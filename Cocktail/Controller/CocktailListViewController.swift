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
		
		
		navigationItem.title = "Cocktail List"
		
		//TODO: luego mudar

			// networking ⬇ : Cocktails
			CocktailApiClient.getCocktails { (success, resultCocktail, error) in
				
				DispatchQueue.main.async {
					
					if success {
						// comprueba si el 'resultMedia' recibido contiene algún valor
						if let resultCocktail = resultCocktail {
							
							self.cocktailArray = resultCocktail // 🔌 👏
							
						
							// test
							for item in self.cocktailArray {
								
								debugPrint("DRINK NAME:\(item.drinkName)")
								debugPrint("DRINK THUMB:\(item.drinkThumb)")
								debugPrint("DRINK ID:\(item.idDrink)")
							}
							debugPrint("cocktail array: \(self.cocktailArray.count)")
							
							
							
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

extension CocktailListViewController: UITableViewDataSource, UITableViewDelegate {
	
	// task: determinar la cantidad de filas que tendrá la tabla
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		debugPrint("los tragos contenidos en el array son \(cocktailArray.count)")
		return cocktailArray.count
		//return 10
	}
	
	// task: configurar la celda de la tabla
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		debugPrint("HOLALAA")
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell

		cell.textLabel?.text = "prueba"
		
//		cocktail = cocktailArray[(indexPath as NSIndexPath).row]
//		debugPrint("😌\(cocktail)")
//		cell.textLabel?.text = cocktail?.drinkName
		

		
		
		
		return cell
		
	}
	
	
	
	
	
	
	
	
	
	
	
}





