//
//  DetailItemView.swift
//  ListView
//
//  Created by Febrico Jonata on 11/11/23.
//

import SwiftUI

struct DetailItemView: View {
    var video : Video
    var body: some View {
        VStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
            
            Text(video.title)
                .font(.headline)
                .bold()
                .multilineTextAlignment(.center)
                .padding(3)
            
            HStack (spacing: 40){
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
            }
            
            Text(video.description)
                .font(.body)
                .padding()
            
        }
        
        
        Link(destination: video.url, label: {
            Text("Watch Now")
                .bold()
                .font(.title2)
                .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(.blue))
                .foregroundColor(.white)
                .cornerRadius(8)
            
        }).padding()
    }
}

#Preview {
    DetailItemView(video: VideoList.topTen.first!)
}
