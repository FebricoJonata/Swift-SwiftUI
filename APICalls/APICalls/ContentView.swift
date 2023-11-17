//
//  ContentView.swift
//  APICalls
//
//  Created by Febrico Jonata on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: GithubUser?
    
    var body: some View {
        VStack (spacing: 20){
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    
                    .foregroundColor(.gray)
            }.frame(width: 200, height: 200)

            
            
            Text(user?.login ?? "")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text(user?.bio ?? "")
                .font(.title3)
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do{
                user = try await getUser()
            } catch GHError.invalidData{
                print("Invalid Data")
            } catch GHError.invalidResponse{
                print("Invalid Response")
            } catch GHError.invalidURL{
                print("Invalid URL")
            } catch {
                print("Unexpected Error")
            }
        }
    }
    
    func getUser() async throws -> GithubUser{
        let endpoint = "https://api.github.com/users/FebricoJonata"
        
        guard let url = URL(string: endpoint) else { throw GHError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw GHError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        }catch{
            throw GHError.invalidData
        }
    }
}

#Preview {
    ContentView()
}


struct GithubUser : Codable{
    let login: String
    let avatarUrl: String
    let bio: String
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
