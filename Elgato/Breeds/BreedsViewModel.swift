//
//  BreedsViewModel.swift
//  Elgato
//
//  Created by Samuel Baraka on 23/08/2022.
//

import Foundation


class BreedsViewModel : ObservableObject{
    @Published var catBreeds: [CatBreed] = []
    @Published var isLoading: Bool = false;
    func fetchBreeds(){
        isLoading=true;
        guard let url=URL(string: RestClient.baseUrl+"/breeds")else{
            return
        }
        
        let task=URLSession.shared.dataTask(with: url){[weak self] data,_,error in
            guard let data=data,error==nil else{
                return
            }
            
            // Convert to Json
            do{
                let catBreeds=try JSONDecoder().decode([CatBreed].self, from: data)
                DispatchQueue.main.async {
                    self?.catBreeds=catBreeds
                }
                
            }catch{
                print(error)
            }
        }
        task.resume()
        isLoading=false;
    }
}
