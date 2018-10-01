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
	@IBOutlet weak var networkActivity: UIActivityIndicatorView!
	
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
							self.networkActivity.stopAnimating()
							self.cocktailTableView.reloadData()
							
							//test
							for item in self.cocktailArray {
								
								// las urls para obtener la imagenes de los tragos
								debugPrint("la imagen del trago: \(item.drinkThumb!)")
							}
			
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
		
		let preImageDrink = UIImage(named: "preImageDrink")
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
		cocktail = cocktailArray[(indexPath as NSIndexPath).row]
		cell.textLabel?.text = cocktail?.drinkName
		cell.imageView?.image = preImageDrink
		
		if let drinkId = cocktail?.idDrink {
			
			let drinkIdInt = Int(drinkId)
			
			let _ = CocktailApiClient.getCocktailImage((cocktail?.drinkThumb)!) { (imageData, error) in
				
				
				
								if let image = UIImage(data: imageData!) {
									
									DispatchQueue.main.async {
										print("🧙🏽‍♀️ datos de la imagen\(imageData!), uimage: \(image)")
										cell.imageView!.image = image
										print("🔎\(image)")
										
										
										
									}
								} else {
									print(error ?? "empty error")
								}
							}

		}
		
		
		// REF THE MOVIE MANAGER
//		if let posterPath = movie.posterPath {
//			let _ = TMDBClient.sharedInstance().taskForGETImage(TMDBClient.PosterSizes.RowPoster, filePath: posterPath, completionHandlerForImage: { (imageData, error) in
//				if let image = UIImage(data: imageData!) {
//					performUIUpdatesOnMain {
//						cell?.imageView!.image = image
//					}
//				} else {
//					print(error ?? "empty error")
//				}
//			})
//		}
		
		
		
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
			
	
	
}





