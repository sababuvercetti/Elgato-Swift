//
//  BreedDetailView.swift
//  Elgato
//
//  Created by Samuel Baraka on 23/08/2022.
//

import SwiftUI

struct BreedDetailView: View {
    var catBreed: CatBreed
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: catBreed.image!.url)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 250, height: 250)
            
            
            Text(catBreed.description)
        }.navigationTitle(catBreed.name)
    }
}
