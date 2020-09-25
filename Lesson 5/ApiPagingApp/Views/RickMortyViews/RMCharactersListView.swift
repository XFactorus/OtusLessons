//
//  RMCharactersListView.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 24.09.2020.
//

import SwiftUI

struct RMCharactersListView: View {
    
    @EnvironmentObject var viewModel: RMCharactersViewModel
    
    var body: some View {
        List(self.viewModel.listDataSource) { character in
            RMCharacterCell(character: character)
                .onAppear() {
                    if self.viewModel.listDataSource.isLast(character) {
                        self.viewModel.fetchPage()
                    }
                }
        }
    }
    
}
    
struct RMCharacterCell: View {
    
    @State var character: RMCharacter
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
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
        .onTapGesture {
            print("Row tapped")
            viewModel.push(RMCharacterDetailsView(character: character))
        }
    }
}


struct RMCharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        RMCharactersListView()
            .environmentObject(RMCharactersViewModel(isMock: true))
    }
}
