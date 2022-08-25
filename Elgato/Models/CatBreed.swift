//
//  File.swift
//  Elgato
//
//  Created by Samuel Baraka on 23/08/2022.
//

import Foundation


struct CatBreed : Hashable,Codable{
    let name: String
    let description: String
    let image: CatImage?
}


struct CatImage : Hashable, Codable{
    let url: String
}
