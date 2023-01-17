//
//  ConvoModel.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 9.12.2022.
//

import Foundation
import SwiftUI

struct ConvoModel : Identifiable {
    var id : String
    var receiverID : String
    var receiverImage : String
    var receiverName : String
    var lastMessage : String
    
}
