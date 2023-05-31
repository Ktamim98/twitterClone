//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Tamim Khan on 23/5/23.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var viewModel = ExploreViewmodel()
    
    
    
    var body: some View {
        
       
            VStack{
                SearchBar(text: $viewModel.searchText)
                    .padding()
                
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.searchAbleUser){ user in
                            NavigationLink{
                                ProfileView(user: user)
                            }label: {
                                UserRow(user: user)
                                
                                
                            }
                            
                        }
                    }
                }
            }
                
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
            
            
        }
        
    }


struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
