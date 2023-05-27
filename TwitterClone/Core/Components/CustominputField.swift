//
//  CustominputField.swift
//  TwitterClone
//
//  Created by Tamim Khan on 27/5/23.
//

import SwiftUI

struct CustominputField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
            }
            Divider()
                .background(Color(.darkGray))
            
        }
    }
}

struct CustominputField_Previews: PreviewProvider {
    static var previews: some View {
        CustominputField(imageName: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
