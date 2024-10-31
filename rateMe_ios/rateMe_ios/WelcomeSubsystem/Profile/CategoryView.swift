//
//  CategoryView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 19.08.24.
//

import SwiftUI

struct CategoryView: View {
    let category: String
    let rating: String
    let color: Color
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Back button action, automatically handled by NavigationLink
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()
                Text(category.uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    // Forward button action, add functionality if needed
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .background(color)
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .frame(height: 180)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(category.uppercased())
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading], 10)
                    
                    Spacer()
                    
                    Text("Your \(category.uppercased()) rating has improved by 5% this week")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                    
                    Spacer()
                    Text(rating)
                        .font(.system(size: 64))
                        .bold()
                        .foregroundColor(.black)
                        .padding([.bottom, .trailing], 10)
                }
            }
            
            ScrollView {
                ForEach(0..<7) { index in
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(color)
                        Text("Sample feedback text here...")
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(index * 3)h")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(color, lineWidth: 1))
                    .padding(.horizontal)
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    CategoryView(category: "Mock", rating: "4.2", color: Color.red)
}
