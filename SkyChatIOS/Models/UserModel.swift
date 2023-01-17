//
//  UserModel.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 6.12.2022.
//

import Foundation
import SwiftUI

struct UserModel : Identifiable {
    var id : String
    var name : String
    var surname : String
    var phoneNo : String
    var status : String
    var imageURL : String
}
