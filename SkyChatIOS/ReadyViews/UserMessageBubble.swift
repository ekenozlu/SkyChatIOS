//
//  UserMessageBubble.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 27.12.2022.
//

import SwiftUI

struct UserMessageBubble: View {
    
    var message : MessageModel
    var bubbleColor = UIColor.systemGreen
    
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Spacer()
                    Text(message.messageText)
                        .padding(15)
                        .background(Color(bubbleColor))
                        .cornerRadius(15)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7,alignment: .trailing)
                        .padding(.trailing, 5)
                        .padding(.top, 5)
                    
                }
                HStack{
                    Spacer()
                    Text("12:15 AM").font(.system(size: 11)).foregroundColor(Color.gray).padding(.trailing, 8)
                    
                }
            }
            Spacer()
        }
        
    }
}

struct UserMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        UserMessageBubble(message: MessageModel(id: 0, messageText: "selam abi",senderID: "qdpYVjq2YtTE8yzr0bWuwO8DsdI3")).previewLayout(.sizeThatFits)
    }
}
