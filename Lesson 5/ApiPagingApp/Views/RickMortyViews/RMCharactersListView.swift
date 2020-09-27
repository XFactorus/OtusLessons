//
//  RMCharactersListView.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 24.09.2020.
//

import SwiftUI

struct RMCharactersListView: View {
    
    @EnvironmentObject var viewModel: RMCharactersViewModel
    @EnvironmentObject private var navModel: NavControllerViewModel
    
    var body: some View {
        List(self.viewModel.listDataSource) { character in
            RMCharacterCell(character: character)
                .onAppear() {
                    if self.viewModel.listDataSource.isLast(character) {
                        self.viewModel.fetchPage()
                    }
                }
                .onTapGesture {
                    print("Row tapped")
                    navModel.push(RMCharacterDetailsView(character: character))
                }
        }
    }
    
}
    
struct RMCharacterCell: View {
    
    @State var character: RMCharacter
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(character.gender ?? "Undefined")
                    .font(.callout)
                Spacer()
            }
            .padding()
            
            Spacer()
            
            Text(character.status?.capitalized ?? "Unknown")
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                
            .frame(height: 64)
        }
        .contentShape(Rectangle())
    }
}


struct RMCharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        RMCharactersListView()
            .environmentObject(RMCharactersViewModel(isMock: true))
    }
}
