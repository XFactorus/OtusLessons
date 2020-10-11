
import SwiftUI

struct BBCharactersListView: View {
    
    @EnvironmentObject var viewModel: BBCharactersViewModel
    @EnvironmentObject private var navModel: NavControllerViewModel
    
    var body: some View {
        List(self.viewModel.listDataSource) { character in
            BBCharacterCell(character: character)
                .onAppear() {
                    if self.viewModel.listDataSource.isLast(character) {
                        self.viewModel.fetchPage()
                    }
                }
                .onTapGesture {
                    print("Row tapped")
                    navModel.push(BBCharacterDetailsView(character: character))
                }
        }
    }
}
    
struct BBCharacterCell: View {
    
    @State var character: BBCharacter
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(character.nickname ?? "Undefined")
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


struct BBCharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        BBCharactersListView()
            .environmentObject(BBCharactersViewModel(isMock: true))
    }
}
