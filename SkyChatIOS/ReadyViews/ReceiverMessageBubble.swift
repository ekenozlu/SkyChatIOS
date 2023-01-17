//
//  MessageBubbleView.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 26.12.2022.
//

import SwiftUI
import Firebase

struct ReceiverMessageBubble: View {
    
    var message : MessageModel
    var bubbleColor = UIColor.systemBlue
    
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Text(message.messageText)
                        .padding(15)
                        .background(Color(bubbleColor))
                        .cornerRadius(15)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7,alignment: .leading)
                        .padding(.leading, 5)
                        .padding(.top, 5)
                    Spacer()
                }
                HStack{
                    Text("12:15 AM").font(.system(size: 11)).foregroundColor(Color.gray).padding(.leading, 8)
                    Spacer()
                }
            }
            Spacer()
        }
        
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiverMessageBubble(message: MessageModel(id: 0, messageText: "selam abi",senderID: "qdpYVjq2YtTE8yzr0bWuwO8DsdI3")).previewLayout(.sizeThatFits)
    }
}
