//
//  CustomSecureField.swift
//  SkyChatIOS
//
//  Created by Eken Özlü on 3.01.2023.
//

import SwiftUI

struct CustomSecureField: View {
    
    @Binding var text : String
    let placeholder : String
    let systemImageName : String
    
    var body: some View{
        ZStack(alignment: .leading) {
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor(Color(.init(white: 3, alpha: 0.15)))
                    .padding(.leading,40)
            }
            HStack(spacing: 20) {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.white)
                SecureField("",text: $text)
            }
        }
        .padding()
        .background(Color("Dark Blue"))
        .cornerRadius(15)
        .foregroundColor(.white)
    }
}
