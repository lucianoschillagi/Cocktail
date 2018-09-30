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
		print("hola")
		debugPrint("🧛🏻‍♂️🧛🏻‍♂️\(self.cocktailArray.count)")
		navigationItem.title = "Cocktail List"
		
		//TODO: luego mudar

			// networking ⬇ : Cocktails
			CocktailApiClient.getCocktails { (success, resultCocktail, error) in
				
				DispatchQueue.main.async {
					
					if success {
						// comprueba si el 'resultMedia' recibido contiene algún valor
						if let resultCocktail = resultCocktail {
							
							self.cocktailArray = resultCocktail // 🔌 👏
							self.cocktailTableView.reloadData()
							
							debugPrint("🧛🏻‍♂️\(self.cocktailArray.count)")
						
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

extension CocktailListViewController: UITableViewDataSource {
	
	//*****************************************************************
	// MARK: - Table View Data Source Methods
	//*****************************************************************
	
	// task: determinar la cantidad de filas que tendrá la tabla
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return cocktailArray.count }
	
	// task: configurar la celda de la tabla
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		debugPrint("HOLALAA")
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell

		
		cocktail = cocktailArray[(indexPath as NSIndexPath).row]
		debugPrint("😌\(cocktail)")
		cell.textLabel?.text = cocktail?.drinkName
		
		return cell
		
	}
	
}
	
	extension CocktailListViewController: UITableViewDelegate {
		
		//*****************************************************************
		// MARK: - Table View Delegate Methods
		//*****************************************************************
		
		// task: navegar hacia el detalle de la película (de acuerdo al listado de películas actual)
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
				let storyboardId = "Detail"
				let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! CocktailDetailViewController
				controller.selecteCocktail = cocktailArray[(indexPath as NSIndexPath).row]
				navigationController!.pushViewController(controller, animated: true)
		}
			
	

//		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//			let storyboardId = "Detail"
//			let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! MovieDetailViewController
//
//			switch navigationItem.title {
//
//			case category["Explore"]:
//				controller.selectedMovie = filteredMoviesArray[(indexPath as NSIndexPath).row]
//				navigationController!.pushViewController(controller, animated: true)
//
//			case category["Popular Movies"]:
//				controller.selectedMovie = popularMoviesArray[(indexPath as NSIndexPath).row]
//				navigationController!.pushViewController(controller, animated: true)
//
//			case category["Top Rated Movies"]:
//				controller.selectedMovie = topRatedMoviesArray[(indexPath as NSIndexPath).row]
//				navigationController!.pushViewController(controller, animated: true)
//
//			case category["Upcoming Movies"]:
//				controller.selectedMovie = upcomingMoviesArray[(indexPath as NSIndexPath).row]
//				navigationController!.pushViewController(controller, animated: true)
//
//			default:
//				print("")
//			}
//
//		}
	
	
	
	
	
}





