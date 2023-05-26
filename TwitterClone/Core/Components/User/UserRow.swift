//
//  UserRow.swift
//  TwitterClone
//
//  Created by Tamim Khan on 26/5/23.
//

import SwiftUI

struct UserRow: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4){
                Text("leonardo")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
               Text("Holywood Actor")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow()
    }
}
