//
//  RMCharacterImage.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 25.09.2020.
//

import SwiftUI

struct RMCharacterImageView: View {
    var imageLink: String?
    
    @ObservedObject var characterImageViewModel:RMCharacterImageViewModel
    
    init(withURL url:String?) {
        characterImageViewModel = RMCharacterImageViewModel(urlString: url ?? "")
    }
    
    var body: some View {
        VStack {
            FakeNavBar(label: "Characters details")
            Spacer()
            Image(uiImage: characterImageViewModel.characterImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:300, height:300)
                .onAppear(perform: {
                    characterImageViewModel.loadCharacterImage()
            })
            Spacer()
        }
    }
}

struct RMCharacterImage_Previews: PreviewProvider {
    static var previews: some View {
        RMCharacterImageView(withURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    }
}
