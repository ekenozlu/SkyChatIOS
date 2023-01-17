//
//  AllUsersListView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import SwiftUI

struct AllUsersListView: View {
    
    @ObservedObject var allUser = AllUsersStore()
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    ForEach(allUser.AllUserArray) { user in
                        NavigationLink(destination: MessagingView(convoID: "test")) {
                            UserRowView(imageURL: user.imageURL,userName: user.name + " " + user.surname,userStatus: user.status)
                        }.lineSpacing(6)
                    }
                }
            }.padding(.top,10)
        }
        
    }
}

struct AllUsersListView_Previews: PreviewProvider {
    static var previews: some View {
        AllUsersListView()
    }
}
