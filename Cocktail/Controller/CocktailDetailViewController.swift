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
	// MARK: - IBOutlets
	//*****************************************************************
	@IBOutlet weak var frameImage: UIView!
	@IBOutlet weak var cocktailImage: UIImageView!
	@IBOutlet weak var ingredients: UITextView!
	@IBOutlet weak var howToPrepare: UILabel!
	@IBOutlet weak var instructions: UITextView!
	
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
