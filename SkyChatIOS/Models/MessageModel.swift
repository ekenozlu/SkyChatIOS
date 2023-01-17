//
//  MessageModel.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 23.12.2022.
//

import Foundation
import SwiftUI

struct MessageModel : Identifiable {
    var id : Int
    var messageText : String
    var senderID : String
}
