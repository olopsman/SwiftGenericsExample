//
//  ContentView.swift
//  SwiftGenericsExample
//
//  Created by Paulo Orquillo on 22/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                //call the generic function - car json
                APICaller.shared.performAPICall(url: "https://api.heroku.com/cars", expectingReturnType: Car.self, completion: { result in
                    switch result {
                    case .success(let car):
                        print(car.modelName)
                    case .failure(let error):
                        print(error)
                    }
                })
                //call the generic function - recipe json
                APICaller.shared.performAPICall(url: "https://api.heroku.com/recipe", expectingReturnType: Recipe.self, completion: { result in
                    switch result {
                    case .success(let recipe):
                        print(recipe.category)
                    case .failure(let error):
                        print(error)
                    }
                })
                
                //call the generic function - fruit json
                APICaller.shared.performAPICall(url: "https://api.heroku.com/fruit", expectingReturnType: Fruit.self, completion: { result in
                    switch result {
                    case .success(let fruit):
                        print(fruit.name)
                    case .failure(let error):
                        print(error)
                    }
                })
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
