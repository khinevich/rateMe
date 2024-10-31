//
//  ProfileViewBottom.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 16.08.24.
//

import SwiftUI

struct ProfileViewRating: View {
    var body: some View {
        ProfileViewWithRating()
    }
}
struct ProfileViewWithRating: View {
    let categories = [
        ("FRIENDLINESS", Color.purple, "4,8"),
        ("RELIABILITY", Color.pink, "4,6"),
        ("VIBE", Color.orange, "3,2"),
        ("COMMUNICATION", Color.cyan, "3,4"),
        ("CONFIDENCE", Color.red, "3,6"),
        ("OVERALL EXPERIENCE", Color.green, "4,1"),
        ("LOOK", Color.blue, "3,3"),
        ("PROFESSIONALISM", Color.yellow, "2,3"),
        ("POLITENESS", Color.red, "2,2")
    ]
    var body: some View {
        ScrollView{
            NavigationView {
                VStack(spacing: 10) {
                    // First row with 3 categories
                    HStack(spacing: 10) {
                        ForEach(0..<3) { index in
                            NavigationLink(destination: CategoryView(category: categories[index].0, rating: categories[index].2, color: categories[index].1)) {
                                RatingCard(category: categories[index].0, color: categories[index].1, rating: categories[index].2)
                            }
                        }
                    }
                    
                    // Single category row
                    NavigationLink(destination: CategoryView(category: categories[3].0, rating: categories[3].2, color: categories[3].1)) {
                        RatingCard(category: categories[3].0, color: categories[3].1, rating: categories[3].2)
                    }
                    
                    // Second row with 3 categories
                    HStack(spacing: 10) {
                        ForEach(4..<7) { index in
                            NavigationLink(destination: CategoryView(category: categories[index].0, rating: categories[index].2, color: categories[index].1)) {
                                RatingCard(category: categories[index].0, color: categories[index].1, rating: categories[index].2)
                            }
                        }
                    }
                    
                    // Single category row
                    NavigationLink(destination: CategoryView(category: categories[7].0, rating: categories[7].2, color: categories[7].1)) {
                        RatingCard(category: categories[7].0, color: categories[7].1, rating: categories[7].2)
                    }
                    
                    // Single category row
                    NavigationLink(destination: CategoryView(category: categories[8].0, rating: categories[8].2, color: categories[8].1)) {
                        RatingCard(category: categories[8].0, color: categories[8].1, rating: categories[8].2)
                    }
                }
                .padding()
                .background(Color("GrayBackground"))
                .navigationBarHidden(true) // Hides the default navigation bar
            }
        }
        .background(Color("GrayBackground"))
        .cornerRadius(15)
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
    }
}
    struct RatingCard: View {
        let category: String
        let color: Color
        let rating: String
        
        var body: some View {
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .frame(height: 120)
                
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Text(rating)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .padding([.bottom, .trailing], 10)
                    }
                }
            }
        }
    }
    
    struct ProfileViewNoRating: View {
        var body: some View {
            VStack (spacing: 20) {
                // Top message
                Text("You don’t have any rating yet!")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                
                // Share and Find Friends Section
                HStack {
                    Spacer()
                    
                    // Share Profile
                    VStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(Color.pinkText)
                            .font(.system(size: 50))
                        Text("Share your RateMe profile and ask your friends to rate you")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                    }
                    
                    Spacer()
                    
                    // Search Friends
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.pinkText)
                            .font(.system(size: 50))
                        Text("Find your friends here and rate them now")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            .background(Color("GrayBackground"))
            .cornerRadius(15)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
    }
    
    
    #Preview {
        ProfileViewRating()
    }
