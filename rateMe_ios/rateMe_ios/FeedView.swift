//
//  FeedView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 17.08.24.
//

import SwiftUI

struct FeedView: View {
    let users = [
        ("MARY", "mary_image", 4),
        ("JAMES", "james_image", 5),
        ("CARLA", "carla_image", 3),
        ("MINA", "mina_image", 4),
        ("DANIEL", "daniel_image", 5),
        ("MARK", "mark_image", 2),
        ("KEVIN", "kevin_image", 4),
        ("HELEN", "helen_image", 5)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("FEED")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding([.leading, .top])
            
            // Grid of users
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(users, id: \.0) { user in
                        UserCardView(name: user.0, rating: user.2)
                        //imageName: user.1
                    }
                }
                .padding([.leading, .trailing, .bottom])
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct UserCardView: View {
    let name: String
    //let imageName: String
    let rating: Int
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 240)
                    .cornerRadius(20)
                    .clipped()
                    .foregroundColor(.white)
                // Plus icon at the top-right corner
                Button(action: {
                    // Action for the plus button
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.pinkText)
                        .font(.system(size: 30))
                        .padding([.top, .trailing], 10)
                }
            }
            
            Text(name)
                .font(.headline)
                .foregroundColor(.white)
            
            // Rating stars
            HStack(spacing: 2) {
                ForEach(0..<5) { star in
                    Image(systemName: star < rating ? "star" : "star")
                        .foregroundColor(star < rating ? .white : .gray.opacity(0.5))
                }
            }
        }
        .frame(width: 160)
    }
}

#Preview {
    FeedView()
}
