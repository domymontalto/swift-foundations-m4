//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Domenico Montalto on 17/06/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // create an instance of data service and get the data

        recipes.self = DataService.getLocalData()
    }
    
}
