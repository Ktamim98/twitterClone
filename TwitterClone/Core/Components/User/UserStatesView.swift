//
//  UserStatesView.swift
//  TwitterClone
//
//  Created by Tamim Khan on 26/5/23.
//

import SwiftUI

struct UserStatesView: View {
    var body: some View {
        
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("0")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            HStack(spacing: 4){
                Text("88M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
        }
    }
}

struct UserStatesView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatesView()
    }
}
