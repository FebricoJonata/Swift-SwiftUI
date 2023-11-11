//
//  ContentView.swift
//  ListView
//
//  Created by Febrico Jonata on 11/11/23.
//

import SwiftUI

struct ListView: View {
    var videoList : [Video] = VideoList.topTen
    var body: some View {
        NavigationView{
            
            List(videoList, id: \.id ) { video in
                NavigationLink(destination: DetailItemView(video: video), label: {
                    
                    
                    HStack {
                        Image(video.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(4)
                        
                        
                        VStack (alignment: .leading, spacing: 5){
                            Text(video.title)
                                .fontWeight(.semibold)
                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                .minimumScaleFactor(0.5)
                            
                            Text(video.uploadDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                        }
                    }
                    
                })
            }
        }
        
    }
}

#Preview {
    ListView()
}
