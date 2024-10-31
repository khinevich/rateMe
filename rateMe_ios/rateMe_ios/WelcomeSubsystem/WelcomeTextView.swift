//
//  LoadingTextView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 14.04.24.
//

import SwiftUI

struct WelcomeTextView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            HStack (spacing: -10){
                Text("Rat")
                    .font(.system(size: 90))
                    .foregroundStyle(Color.white)
                Image("rateMeLogo")
                    .scaleEffect(CGSize(width: 1.2, height: 1.2))
                Text("Me")
                    .font(.system(size: 90))
                    .foregroundStyle(Color.white)
            }
        }
    }
}

#Preview {
    WelcomeTextView()
}
