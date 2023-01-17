//
//  ConvosView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import SwiftUI

struct ConvosView: View {
    
    @State var newChatClicked = false
    @State var isConvoClicked = false
    
    @ObservedObject var convoStore = ConvoStore()
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(convoStore.convoArray){ convo in
                    NavigationLink(destination: MessagingView(convoID: convo.id)){
                        ConvoRowView(convo: convo).padding(-10)
                    }.listRowInsets(EdgeInsets(top: 1, leading: 5, bottom: 1, trailing: -10))
                }
            }.navigationTitle(Text("Convos"))
                .navigationBarTitleDisplayMode(.automatic)
                
                .toolbar {
                    Button {
                        newChatClicked.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }.sheet(isPresented: $newChatClicked) {
                        AllUsersListView().presentationDetents([.large])
                    }

                }
        }
    }
}

struct ConvosView_Previews: PreviewProvider {
    static var previews: some View {
        ConvosView()
    }
}
