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
            RMCharacterCell(title: character.name,
                            status: character.status ?? "",
                            gender: character.gender ?? "")
                .onAppear() {
                    if self.viewModel.listDataSource.isLast(character) {
                        self.viewModel.fetchPage()
                    }
                }
        }
    }
    
}
    
struct RMCharacterCell: View {
    
    @State var title: String
    @State var status: String
    @State var gender: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(gender)
                    .font(.callout)
                Spacer()
            }
            .padding()
            
            Spacer()
            
            Text(status.capitalized)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                
            .frame(height: 64)
        }
    }
}


struct RMCharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        RMCharactersListView()
            .environmentObject(RMCharactersViewModel(isMock: true))
    }
}
