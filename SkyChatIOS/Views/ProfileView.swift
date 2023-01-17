//
//  ProfileView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ProfileView: View {
    
    //@ObservedObject var userProfile = UserProfileStore()
    var denemeUser = UserModel(id: "123", name: "Eken", surname: "Özlü", phoneNo: "05376278065", status: "HEYY", imageURL: "https://firebasestorage.googleapis.com/v0/b/skyc-2d5bc.appspot.com/o/profilepics%2FqdpYVjq2YtTE8yzr0bWuwO8DsdI3.png?alt=media&token=fb790cc6-28dd-415c-a697-77c28e11a682")
    @State var loginStatus = true
    @State var editButtonClicked = false
    
    var body: some View {
        if loginStatus{
                ZStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 0.4, alignment: .top)
                        .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.2)
                        .foregroundColor(Color("Light Blue"))
                        .edgesIgnoringSafeArea(.top)
                    
                    ScrollView {
                        VStack(alignment: .center){
                            ProfilePicView(imageURL: denemeUser.imageURL,strokeWidth: 10,shadowRadius: 5)
                                .frame(width: 230)
                                .padding(.bottom, 15)
                                .padding(.top, UIScreen.main.bounds.height * 0.15)
                                .padding(.horizontal,15)
                            
                            Text(denemeUser.name + " " + denemeUser.surname).font(.title).bold()
                            Text(denemeUser.status)
                            Text("+9" + denemeUser.phoneNo)
                            
                            Spacer()
                            
                            Button {
                                do{
                                    try Auth.auth().signOut()
                                } catch{
                                    
                                }
                                loginStatus.toggle()
                            } label: {
                                Text("Log Out")
                            }
                        }
                    }
                }
        } else {
            NavigationLink(destination: AuthView()) {
                Text("Logged Out")
            }
        }
        
        
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
