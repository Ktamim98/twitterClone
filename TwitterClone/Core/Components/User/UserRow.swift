//
//  UserRow.swift
//  TwitterClone
//
//  Created by Tamim Khan on 26/5/23.
//

import SwiftUI
import Kingfisher

struct UserRow: View {
    let user: User
    
    
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 48)
            VStack(alignment: .leading, spacing: 4){
                Text(user.fullname)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                Text(user.username)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct UserRow_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRow()
//    }
//}
