//
//  AllUsersStore.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import SwiftUI
import Firebase
import Combine

class AllUsersStore : ObservableObject {
    
    @Published var AllUserArray : [UserModel] = []
    var didChange = PassthroughSubject<Array<Any>,Never>()
    
    let db = Firestore.firestore()
    
    init(){
        db.collection("users").addSnapshotListener { snapshot, error in
            if error != nil {
                
            } else {
                self.AllUserArray.removeAll(keepingCapacity: false)
                
                for document in snapshot!.documents {
                    if let userID = document.get("authID") as? String{
                        if userID != Auth.auth().currentUser?.uid{
                            if let userName = document.get("name") as? String {
                                if let userSurname = document.get("surname") as? String {
                                    if let userPhonenNo = document.get("phoneNumber") as? String {
                                        if let userStatus = document.get("status") as? String {
                                            if let userImage = document.get("profilePicURL") as? String {
                                                let user = UserModel(id: userID,
                                                                      name: userName,
                                                                      surname: userSurname,
                                                                      phoneNo: userPhonenNo,
                                                                      status: userStatus,
                                                                      imageURL: userImage)
                                                self.AllUserArray.append(user)
                                            }
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                self.didChange.send(self.AllUserArray)
                
            }
        }
    }
    
}
