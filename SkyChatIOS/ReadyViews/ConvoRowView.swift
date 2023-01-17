//
//  ConvoRowView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 12.12.2022.
//

import SwiftUI

struct ConvoRowView: View {
    var convo : ConvoModel
    
    var body: some View {
        ZStack{
            Color("Light Blue")
            HStack(){
                ProfilePicView(imageURL: convo.receiverImage,strokeWidth: 2,shadowRadius: 0)
                    .frame(width: UIScreen.main.bounds.width * 0.18)
                
                VStack(alignment: .leading,spacing: 3){
                    Text(convo.receiverName)
                        .foregroundColor(Color.black)
                        .bold()
                        .font(.system(size: 20))
                    Text(convo.lastMessage)
                        .foregroundColor(Color.black)
                        .frame(maxHeight: 35)
                }.padding(.leading,5)
            }.padding(.horizontal, 5)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9, alignment: .leading)
        }.frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.1)
            .cornerRadius(10)
            .padding(5)
        
    }
}

struct ConvoRowView_Previews: PreviewProvider {
    static var previews: some View {
        ConvoRowView(convo: ConvoModel(id: "AA", receiverID: "AA", receiverImage: "https://firebasestorage.googleapis.com/v0/b/skyc-2d5bc.appspot.com/o/profilepics%2F8VLx5oHzuVSZPilBQiFdwdJ7AOY2.png?alt=media&token=e7fcf341-6a9d-45d9-bca8-96621f668d92", receiverName: "Bruce Wayne", lastMessage: "nasilsin abi"))
    }
}
