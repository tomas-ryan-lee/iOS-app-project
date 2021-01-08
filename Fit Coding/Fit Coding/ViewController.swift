//
//  ViewController.swift
//  Fit Coding
//
//  Created by Kévin Rifa on 07/01/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.spoonacular.com/recipes/716429/information?apiKey=0a244cc1f5704bc8ad9d876a898283a2&includeNutrition=false"
        getData(from: url)
    }
    
    private func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("failed to convert \(error)")
            }
            guard let json = result else {
                return
            }
            print(json.extendedIngredients)
        })
        
        task.resume()
    }
}

struct Response: Codable {
    let extendedIngredients: [Data]
        
}

struct Data: Codable {
    let name: String
    
}

