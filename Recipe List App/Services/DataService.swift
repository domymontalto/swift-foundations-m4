//
//  DataService.swift
//  Recipe List App
//
//  Created by Domenico Montalto on 17/06/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        //Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Get a url path to the json file
        let url = URL(fileURLWithPath: pathString!)
        
        
        do{
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with JSON decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    // Add unique IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            }
            catch{
                // error with parsing json
                print(error)
            }
        }
        catch{
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
