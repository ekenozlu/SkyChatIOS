//
//  MessagesStore.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 23.12.2022.
//

import SwiftUI
import Firebase
import Combine

class MessagesStore : ObservableObject {
    @Published var messageArray : [MessageModel] = []
    var didChange = PassthroughSubject<Array<Any>,Never>()
    let db = Firestore.firestore()
    
    init(convoID : String){
        db.collection("convos").document(convoID).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let messageArrayFromDB = snapshot?.get("chatArray") as? Array<Dictionary<String, Any>> {
                    self.messageArray.removeAll(keepingCapacity: false)
                    for message in messageArrayFromDB {
                        
                        let currentIndex = self.messageArray.last?.id
                        
                        let tempMessage = MessageModel(id: (currentIndex ?? -1) + 1,
                                                       messageText: message["message"] as! String,
                                                       senderID: message["senderID"] as! String)
                        
                        self.messageArray.append(tempMessage)
                    }
                }
                self.didChange.send(self.messageArray)
            }
        }
    }
    
    
    
}
