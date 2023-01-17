//
//  ConvoStore.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 9.12.2022.
//

import SwiftUI
import Firebase
import Combine

class ConvoStore : ObservableObject {
    
    @Published var convoArray : [ConvoModel] = []
    var didChange = PassthroughSubject<Array<Any>,Never>()
    
    let db = Firestore.firestore()
    
    init(){
        db.collection("convos").whereField("userArray", arrayContains: Auth.auth().currentUser!.uid).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.convoArray.removeAll(keepingCapacity: false)
                for document in snapshot!.documents {
                    let convoID = document.documentID
                    var receiver = ""
                    if let receiverID = document.get("userArray") as? Array<String> {
                        if receiverID[0] != Auth.auth().currentUser!.uid{
                            receiver = receiverID[0]
                        } else {
                            receiver = receiverID[1]
                        }
                        if let chatArray = document.get("chatArray") as? Array<[String:Any]> {
                            let lastMessage = chatArray.last!["message"] as? String
                            //GETTING RECEIVER DATA
                            self.db.collection("users").document(receiver).addSnapshotListener { document, error in
                                if error != nil {
                                    
                                } else {
                                    if let receiverName = document?.get("name") as? String{
                                        if let receiverSurname = document?.get("surname") as? String {
                                            if let receiverImage = document?.get("profilePicURL") as? String{
                                                let convo = ConvoModel(id: convoID, receiverID: receiver, receiverImage: receiverImage, receiverName: receiverName + " " + receiverSurname, lastMessage: lastMessage!)
                                                self.convoArray.append(convo)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                self.didChange.send(self.convoArray)
            }
        }
    }
}
