//
//  BreedsView.swift
//  Elgato
//
//  Created by Samuel Baraka on 23/08/2022.
//

import SwiftUI

struct BreedsView: View {
    @StateObject var breedsViewModel=BreedsViewModel()
    var body: some View {
        if breedsViewModel.isLoading{
            ProgressView{}.padding(20)
        }else{
        NavigationView{
            List{
                ForEach(breedsViewModel.catBreeds,id: \.self){catBreed in
                    NavigationLink {
                        BreedDetailView(catBreed: catBreed)
                    } label: {
                        Text(catBreed.name).padding(3)
                    }
                    
                }
            }.navigationTitle("Cat breeds")
        }.onAppear(){
            breedsViewModel.fetchBreeds()
        }
        }
    }
}

struct BreedsView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsView()
    }
}
