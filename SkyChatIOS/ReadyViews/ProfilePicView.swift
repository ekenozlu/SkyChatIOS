//
//  ProfilePicView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import SwiftUI

struct ProfilePicView: View {
    
    var imageURL : String
    var strokeWidth : CGFloat
    var shadowRadius : CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: strokeWidth))
                .shadow(radius: shadowRadius)
        } placeholder: {
            Image("profilepic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: strokeWidth))
                .shadow(radius: shadowRadius)
        }

    }
}

struct ProfilePicView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicView(imageURL: "https://firebasestorage.googleapis.com/v0/b/skyc-2d5bc.appspot.com/o/profilepics%2F8VLx5oHzuVSZPilBQiFdwdJ7AOY2.png?alt=media&token=e7fcf341-6a9d-45d9-bca8-96621f668d92",strokeWidth: 10,shadowRadius: 5)
    }
}
