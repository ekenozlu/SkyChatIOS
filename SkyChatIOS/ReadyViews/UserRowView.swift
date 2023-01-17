//
//  UserRowView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 8.12.2022.
//
import SwiftUI

struct UserRowView: View {
    
    var imageURL : String
    var userName : String
    var userStatus : String
    
    
    var body: some View {
        ZStack{
            Color("Light Blue")
            HStack{
                ProfilePicView(imageURL: imageURL,strokeWidth: 2,shadowRadius: 0)
                    .frame(width: UIScreen.main.bounds.width * 0.18)
                
                VStack(alignment: .leading, spacing: 3){
                    Text(userName)
                        .foregroundColor(Color.black)
                        .bold()
                        .font(.system(size: 20))
                    Text(userStatus)
                        .foregroundColor(Color.black)
                        .frame(maxHeight: 35)
                }.padding(.leading,5)
            }.padding(.horizontal,5)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9, alignment: .leading)
        }.frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.1)
            .cornerRadius(10)
            .padding(5)
        
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(imageURL: "https://firebasestorage.googleapis.com/v0/b/skyc-2d5bc.appspot.com/o/profilepics%2F8VLx5oHzuVSZPilBQiFdwdJ7AOY2.png?alt=media&token=e7fcf341-6a9d-45d9-bca8-96621f668d92", userName: "Bruce Wayne", userStatus: "Don't Bother").previewLayout(.sizeThatFits)
    }
}
