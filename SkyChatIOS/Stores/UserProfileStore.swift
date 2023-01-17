//
//  UserProfileStore.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import SwiftUI
import Firebase
import Combine

class UserProfileStore : ObservableObject {
    
    @Published var user = UserModel(id: "", name: "", surname: "", phoneNo: "", status: "", imageURL: "")
    
    let db = Firestore.firestore()
    var didChange = PassthroughSubject<UserModel,Never>()
    
    init(){
        db.collection("users").document(Auth.auth().currentUser!.uid).addSnapshotListener { snapshot, error in
            if error != nil{
                
            } else {
                if let userID = snapshot?.get("authID") as? String{
                    if let userName = snapshot?.get("name") as? String {
                        if let userSurname = snapshot?.get("surname") as? String {
                            if let userPhonenNo = snapshot?.get("phoneNumber") as? String {
                                if let userStatus = snapshot?.get("status") as? String {
                                    if let userImage = snapshot?.get("profilePicURL") as? String {
                                        self.user = UserModel(id: userID,
                                                              name: userName,
                                                              surname: userSurname,
                                                              phoneNo: userPhonenNo,
                                                              status: userStatus,
                                                              imageURL: userImage)
                                        
                                        self.didChange.send(self.user)
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
