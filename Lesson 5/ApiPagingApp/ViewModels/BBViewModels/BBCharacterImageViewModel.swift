//
//  BBCharacterImageViewModel.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 27.09.2020.
//

import Foundation
import Combine
import SwiftUI

final class BBCharacterImageViewModel: ObservableObject {
    @Published private(set) var characterImage = UIImage()
    
    private var imageUrlString: String?
    
    let networkManager = NetworkManager()
    
    init(urlString:String) {
        self.imageUrlString = urlString
    }
    
    func loadCharacterImage() {
        
        guard let imageUrl = imageUrlString else {
            print("Empty image URL string")
            return
        }
        networkManager.downloadBBImage(imageUrl: imageUrl)
        { (imageData, errorText) in
            guard let imageData = imageData, errorText == nil else {
                print(errorText ?? "Empty image")
                return
            }
            
            guard let image = UIImage(data: imageData) else {
                print(errorText ?? "Cannot extract image from data")
                return
            }
            
            DispatchQueue.main.async {
                self.characterImage = image
            }
            
        }
    }
}
