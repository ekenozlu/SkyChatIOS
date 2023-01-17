//
//  SecondView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import SwiftUI
import Firebase

struct SecondView: View {
    
    @ObservedObject var userProfile = UserProfileStore()
    
    @State var selection = 0
    @State var newChatClicked = false
    @State var editButtonClicked = false
    @State var formSuccess = false
    
    var body: some View {
        NavigationView{
            VStack{
                TabsView
            }
            
        }
    }
    
    var TabsView: some View{
        NavigationView{
            TabView(selection: $selection){
                ConvosTabView()
                    .tabItem {
                        Label("Convos", systemImage: "message")
                    }.tag(0)
                
                ProfileTabView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }.tag(1)
            }.navigationTitle(selection == 0 ? "Convos" : "Profile")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    if selection == 0 {
                        Button {
                            newChatClicked.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }.sheet(isPresented: $newChatClicked) {
                            AllUsersListView().presentationDetents([.large])
                        }
                    }
                    else if selection == 1 {
                        Button {
                            editButtonClicked.toggle()
                        } label: {
                            Image(systemName: "slider.horizontal.3").foregroundColor(Color.black)
                        }.sheet(isPresented: $editButtonClicked) {
                            FormView(formSuccess: $formSuccess,
                                     isProfileEdit: true,
                                     formName: userProfile.user.name,
                                     formSurname: userProfile.user.surname,
                                     formPhoneNo: userProfile.user.phoneNo,
                                     formStatus: userProfile.user.status).presentationDetents([.large])
                        }
                    }
                    
                }
        }
        
        
    }
}

//MARK: -CONVO TAB VIEW
struct ConvosTabView : View {
    
    @ObservedObject var convoStore = ConvoStore()
    
    var body: some View{
        VStack{
            ScrollView {
                ForEach(convoStore.convoArray){ convo in
                    NavigationLink(destination: MessagingView(convoID: convo.id)){
                        ConvoRowView(convo: convo)
                    }
                }
            }
        }
    }
}

//MARK: -PROFILE TAB VIEW
struct ProfileTabView : View {
    
    @ObservedObject var userProfile = UserProfileStore()
    @State var loginStatus = true
    @State var editButtonClicked = false
    
    var body: some View{
        if loginStatus{
            ZStack{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 0.4, alignment: .top)
                    .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.2)
                    .foregroundColor(Color("Light Blue"))
                    .edgesIgnoringSafeArea(.top)
                
                ScrollView {
                    VStack(alignment: .center){
                        ProfilePicView(imageURL: userProfile.user.imageURL,strokeWidth: 10,shadowRadius: 5)
                            .frame(width: 230)
                            .padding(.bottom, 15)
                            .padding(.top, UIScreen.main.bounds.height * 0.1)
                            .padding(.horizontal,15)
                        
                        Text(userProfile.user.name + " " + userProfile.user.surname).font(.title).bold()
                        Text(userProfile.user.status)
                        Text("+9" + userProfile.user.phoneNo)
                        
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
            //MARK: -LOG OUT DÜZELT
            AuthView()
        }
    }
}





struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
