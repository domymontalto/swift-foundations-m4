//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Domenico Montalto on 18/06/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment:.leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    .padding(.top, 20)
                
                // MARK: Serving Size Picker
                VStack(alignment:.leading){
                    Text("Select your serving size:")
                    Picker("Servings", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width:160)
                }
                .padding()
                

                
                
                // MARK: Ingredients
                
                VStack(alignment:.leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize)  + " " + item.name.lowercased())
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0...recipe.directions.count - 1, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
