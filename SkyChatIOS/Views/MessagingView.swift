//
//  MessagingView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 8.12.2022.
//

import SwiftUI
import Firebase

struct MessagingView: View {
    
    var convoID : String
    
    
    var body: some View {
        InnerMessagingView(convoID: convoID, messagesStore: MessagesStore(convoID: convoID))
    }
}

struct InnerMessagingView : View {
    var convoID : String
    @ObservedObject var messagesStore : MessagesStore
    
    @State var messageText = ""
    let db = Firestore.firestore()
    
    init(convoID: String, messagesStore: MessagesStore) {
        self.convoID = convoID
        self.messagesStore = messagesStore
    }
    
    var body: some View{
        VStack{
            ScrollView {
                ScrollViewReader { value in
                    ForEach(messagesStore.messageArray) { message in
                        if message.senderID == Auth.auth().currentUser?.uid {
                            UserMessageBubble(message: message)
                        } else {
                            ReceiverMessageBubble(message: message)
                        }
                    }.onChange(of: messagesStore.messageArray.count) { _ in
                        value.scrollTo(messagesStore.messageArray.count - 1)
                    }
                }
            }

            Spacer()
            HStack{
                TextField("Message Here", text: $messageText)
                    .padding(5)
                Button {
                    if messageText != "" {
                        //SEND MESSAGE
                        let message = ["message" : messageText,
                                       "senderID" : Auth.auth().currentUser!.uid,
                                       "seen" : false,
                                       "timestamp" : Date.now] as [String : Any]
                        db.collection("convos").document(convoID).updateData(["chatArray" : FieldValue.arrayUnion([message])])
                        messageText = ""
                    }
                } label: {
                    Text("Send")
                }

            }.padding(10)
        }.navigationTitle(Text("Bruce Wayne")).navigationBarTitleDisplayMode(.inline)
        
            
        }
    }





struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView(convoID: "aasdfasdfasdf")
    }
}
