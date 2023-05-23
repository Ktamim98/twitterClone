//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Tamim Khan on 23/5/23.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 13){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text("Tony Stark")
                            .font(.subheadline).bold()
                        Text("@IronMan")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2W")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                   Text("I'm Rich and i have super power")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            HStack{
                Button{
                    
                }label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
        
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
